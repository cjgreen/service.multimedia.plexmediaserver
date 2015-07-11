#
#  Plex Plug-in Framework
#  Copyright (C) 2008-2012 Plex, Inc. (James Clarke, Elan Feingold). All Rights Reserved.
#

from systemservice import SystemService
import re


UPDATE_FEED_KEY = 'PlexPluginUpdateFeed'

class BundleInfo(object):
  def __init__(self, system, plugins_path, name):
    self.system = system
    self.path = Core.storage.join_path(plugins_path, name)
    self.name = name
    self.update_hash()
    
  def load_plist(self):
    plist = Plist.ObjectFromString(Core.storage.load(Core.storage.join_path(self.path, "Contents", "Info.plist")))
    self.service_dict = Core.services.get_services_from_bundle(self.path, plist)
    self.identifier = plist['CFBundleIdentifier']
    self.plugin_class = plist.get('PlexPluginClass', 'Channel')
    
    # Read the update feed from the plist, if present
    if UPDATE_FEED_KEY in plist:
      url = plist[UPDATE_FEED_KEY]
      if url[-1] != '/':
        url += '/'
      self.update_feed = url
    else:
      self.update_feed = None
    
    self.ignore = 'PlexPluginDevMode' in plist and plist['PlexPluginDevMode'] == '1'
    if Core.storage.link_exists(self.path):
      Log("Plug-in bundle with identifier '%s' is a symbolic link, and will be ignored.", self.identifier)
      self.ignore = True
      
    # If we found an agent bundle, check that the agent info exists.
    if self.plugin_class == 'Agent':
      self.system.agentservice.ensure_agent_info_exists(self.identifier)
    
  
  @property
  def has_services(self):
    for key in ('Services', 'ServiceSets', 'OldServices'):
      for service_type in self.service_dict[self.identifier][key]:
        if len(self.service_dict[self.identifier][key][service_type]) > 0:
          return True
    return False
    
  @property
  def managed(self):
    return self.identifier in self.system.storeservice.plugins and not self.ignore

  def update_hash(self):
    self.load_plist()
    file_hashes = {}
    full_paths = []
    for path, dirs, files in Core.storage.walk(self.path):
      relative_path = path[len(self.path):]
      ignore = False
      for part in relative_path.split('/'):
        if len(part) > 0 and part[0] == '.':
          ignore = True
          break
          
      if ignore:
        continue
        
      for f in files:
        if f[0] != '.' and not f.endswith('.pyc'):
          full_path = Core.storage.join_path(path, f).replace('\\', '/')
          full_paths.append(full_path)
          file_hashes[full_path] = Hash.SHA1(Core.storage.load(Core.storage.join_path(path, f)))
    full_paths.sort()
    hash_str = ''
    for path in full_paths: hash_str = hash_str + file_hashes[path]
    self.hash = Hash.SHA1(hash_str)
    

class BundleService(SystemService):
  def __init__(self, system):
    SystemService.__init__(self, system)
    Log.Debug("Starting the bundle service")
    
    self.plugins_path = Core.storage.join_path(Core.app_support_path, 'Plug-ins')
    self.bundle_dict = dict()
    self.update_lock = Thread.Lock()
    self.service_started = Thread.Event()
    self.first_scan = True
    
    Core.messaging.expose_function(self.all_services, '_BundleService:AllServices')
    
    Thread.Create(self.start)
    
  def start(self):
    self.update_bundles()
    self.service_started.set()
    Log.Debug("Started the bundle service")
    
  @property
  def bundles(self):
    self.service_started.wait()
    return self.bundle_dict
    
  def all_services(self):
    service_dict = {}
    bundles = self.bundles
    for identifier in bundles:
      bundle = bundles[identifier]
      if bundle.has_services:
        service_dict.update(bundle.service_dict)
    return service_dict
    
  def update_bundles(self, remove_unavailable_agents=True):
    try:
      self.update_lock.acquire()
      dir_contents = Core.storage.list_dir(self.plugins_path)
      identifiers = self.bundle_dict.keys()
      for identifier in identifiers:
        if self.bundle_dict[identifier].name not in dir_contents:
          del self.bundle_dict[identifier]
        else:
          dir_contents.remove(self.bundle_dict[identifier].name)
      
      for filename in dir_contents:
        if filename[-7:] == '.bundle':
          plist_path = Core.storage.join_path(self.plugins_path, filename, 'Contents', 'Info.plist')
          if Core.storage.file_exists(plist_path):
            try:
              bundle = BundleInfo(self.system, self.plugins_path, filename)
              if self.first_scan and bundle.identifier in self.bundle_dict:
                old_filename = self.bundle_dict[bundle.identifier].name
                Log("Deleting '%s' because it has a duplicate identifier '%s' (new plug-in '%s' found)", old_filename, bundle.identifier, filename)
                Core.storage.remove_tree(Core.storage.join_path(self.plugins_path, old_filename))
              self.bundle_dict[bundle.identifier] = bundle
            except:
              Log.Exception('Exception adding bundle')

      if remove_unavailable_agents:
        Thread.Create(self.system.agentservice.remove_unavailable_agents)
      
    finally:
      self.first_scan = False
      self.update_lock.release()

