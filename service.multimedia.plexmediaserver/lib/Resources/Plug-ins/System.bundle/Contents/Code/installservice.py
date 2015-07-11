#
#  Plex Plug-in Framework
#  Copyright (C) 2008-2012 Plex, Inc. (James Clarke, Elan Feingold). All Rights Reserved.
#

from systemservice import SystemService
import storeservice
import sys

AS_URL                      = storeservice.AS_URL
HISTORY_KEY                 = "_StoreService:History"

IDENTIFIER_KEY              = "InstallIdentifier"
NOTES_KEY                   = "InstallNotes"
DATE_KEY                    = "InstallDate"
VERSION_KEY                 = "InstallVersion"
ACTION_KEY                  = "InstallAction"

FRAMEWORK_UPDATE_COMPLETE   = "FrameworkUpdateComplete"
SYSTEM_UPDATE_COMPLETE      = "SystemUpdateComplete"
ALL_UPDATES_COMPLETE        = "AllUpdatesComplete"
UPDATE_FAILED               = "UpdateFailed"
ALREADY_INSTALLING          = "AlreadyInstalling"


class InstallService(SystemService):
  def __init__(self, system):
    SystemService.__init__(self, system)
    Log.Debug("Starting the install service")
    
    self.installing = False
    self.stage = Core.storage.join_path(Core.storage.data_path, 'DataItems', 'Stage')
    self.inactive = Core.storage.join_path(Core.storage.data_path, 'DataItems', 'Deactivated')
    
    try:
      Core.storage.remove_tree(self.stage)
    except:
      Log.Error("Unable to remove staging root")
    Core.storage.make_dirs(self.stage)
    
    try:
      Core.storage.remove_tree(self.inactive)
    except:
      Log.Error("Unable to remove inactive root")
    Core.storage.make_dirs(self.inactive)
    
    if HISTORY_KEY in Dict:
      self.history = Dict[HISTORY_KEY]
    else:
      self.history = list()
    self.history_lock = Thread.Lock()
    
    Route.Connect('/system/appstore/apps/{identifier}/install', self.gui_install)
    Route.Connect('/system/appstore/apps/{identifier}/update', self.gui_update)
    Route.Connect('/system/appstore/apps/{identifier}/restart', self.gui_restart)
    Route.Connect('/system/appstore/apps/{identifier}/reset', self.gui_reset)
    Route.Connect('/system/appstore/apps/{identifier}/uninstall', self.gui_uninstall)
    Route.Connect('/system/appstore/updates/install', self.gui_install_all_updates)
    Route.Connect('/system/appstore/history', self.gui_update_history_menu)
    
    Route.Connect('/system/plexonline/apps/{identifier}/install', self.gui_install)
    Route.Connect('/system/plexonline/apps/{identifier}/update', self.gui_update)
    Route.Connect('/system/plexonline/apps/{identifier}/restart', self.gui_restart)
    Route.Connect('/system/plexonline/apps/{identifier}/reset', self.gui_reset)
    Route.Connect('/system/plexonline/apps/{identifier}/uninstall', self.gui_uninstall)
    Route.Connect('/system/plexonline/updates/install', self.gui_install_all_updates)
    Route.Connect('/system/plexonline/history', self.gui_update_history_menu)
    
    Route.Connect('/system/channeldirectory/history', self.gui_update_history_menu)
    Route.Connect('/system/channeldirectory/updates/install', self.gui_install_all_updates)
    
  def info_record(self, identifier, action, version=None, notes=None):
    info = dict()
    info[IDENTIFIER_KEY] = identifier
    info[DATE_KEY] = Datetime.Now()
    info[ACTION_KEY] = action
    if notes:
      info[NOTES_KEY] = notes
    if version:
      info[VERSION_KEY] = version
    return info
    
  def add_history_record(self, identifier, action, version=None, notes=None):
    info = self.info_record(identifier, action, version, notes)
    try:
      self.history_lock.acquire()
      self.history.append(info)
      Dict[HISTORY_KEY] = self.history
      Dict.Save()
    finally:
      self.history_lock.release()
    
  def setup_stage(self, identifier):
    stage_path = Core.storage.join_path(self.stage, identifier)
    Log("Setting up staging area for %s at %s" % (identifier, stage_path))
    Core.storage.remove_tree(stage_path)
    Core.storage.make_dirs(stage_path)
    return stage_path
    
  def unstage(self, identifier):
    stage_path = Core.storage.join_path(self.stage, identifier)
    Log("Unstaging files for %s (removing %s)" % (identifier, stage_path))
    Core.storage.remove_tree(stage_path)
      
  def cleanup(self, identifier):
    # Don't delete the old Framework.bundle on Windows, as it will fail because the file is in use
    if identifier == 'com.plexapp.framework' and sys.platform == 'win32':
      return
    inactive_path = Core.storage.join_path(self.inactive, identifier)
    if Core.storage.dir_exists(inactive_path):
      Log("Cleaning up after %s (removing %s)" % (identifier, inactive_path))
      Core.storage.remove_tree(inactive_path)
    
  def deactivate(self, identifier):
    if identifier in self.system.bundleservice.bundles:
      bundle = self.system.bundleservice.bundles[identifier]
      inactive_path = Core.storage.join_path(self.inactive, identifier, bundle.name)
      self.cleanup(identifier)
      Log("Deactivating an old installation of %s (moving to %s)" % (identifier, inactive_path))
      Core.storage.make_dirs(inactive_path)
      Core.storage.rename(Core.storage.join_path(self.system.bundleservice.plugins_path, bundle.name), inactive_path)
      return True
    return False

  def reactivate(self, identifier):
    try:
      if identifier in self.system.bundleservice.bundles:
        bundle = self.system.bundleservice.bundles[identifier]
        inactive_path = Core.storage.join_path(self.inactive, identifier, bundle.name)
        Log("Reactivating the old installation of %s (moving from %s)" % (identifier, inactive_path))
        Core.storage.rename(inactive_path, Core.storage.join_path(self.system.bundleservice.plugins_path, bundle.name))
        return True
    except:
      Log.Exception("Unable to reactivate the old installation of %s", identifier)
    return False    
    
  def activate(self, identifier, name, fail_count = 0):
    stage_path = Core.storage.join_path(self.stage, identifier)
    final_path = Core.storage.join_path(self.system.bundleservice.plugins_path, "%s.bundle" % name)
    
    if not Core.storage.dir_exists(stage_path):
      Log("Unable to find stage for %s" % identifier)
      return False
    if Core.storage.dir_exists(final_path):
      Log("Plugin named %s.bundle already installed at %s - removing" % (name, final_path))
      Core.storage.remove_tree(final_path)
    Log("Activating a new installation of %s" % identifier)
    try:
      Core.storage.rename(stage_path, final_path)
    except:
      Log.Exception("Unable to activate %s at %s" % (identifier, final_path))
      if fail_count < 5:
        Log.Info("Waiting 2s and trying again")
        Thread.Sleep(2)
        return self.activate(identifier, name, fail_count + 1)
      else:
        Log.Info("Too many failures - returning")
        return False
    return True
    
  def platform_needs_file(self, parts):
    os = Platform.OS
    cpu = Platform.CPU
    #return not ((len(parts) > 4 and parts[1] in ('Helpers', 'Libraries') and (parts[2] != 'Shared') and (parts[2] != os or parts[3] != cpu)) or (len(parts) > 5 and parts[1] == 'Resources' and parts[2] == 'Platforms' and (parts[3] != 'Shared') and (parts[3] != os or parts[4] != cpu)))
    
    # All files above here are needed.
    if len(parts) <= 4:
      return True
    
    # Check for platform-specific helpers or libraries
    if parts[1] in ('Helpers', 'Libraries'):
      # If the file resides in the Shared folder, or the OS and CPU matches, it is required
      if (parts[2] == 'Shared') or (parts[2] == os and parts[3] == cpu):
        return True
      else:
        return False
      
    # Check for files in Resources/Platforms (where the framework files are stored)
    if len(parts) >= 5 and parts[1] == 'Resources' and parts[2] == 'Platforms':
      # If the file resides in the Shared folder, or the OS and CPU matches, it is required
      if (parts[3] == 'Shared') or (parts[3] == os and parts[4] == cpu):
        return True
      else:
        return False
      
    # Otherwise, assume the file is required
    return True
    
    
  def install_zip_from_url(self, identifier, name, url, check_platform=True):
    try:
      archive = Archive.Zip(HTTP.Request(url, cacheTime=0))
    except:
      Log("Unable to download archive for %s" % identifier)
      self.unstage(identifier)
      return False

    if archive.Test() != None:
      Log.Add("The archive of %s is invalid - unable to continue" % identifier)
      self.unstage(identifier)
      return False
    
    try:
      for archive_name in archive:
        parts = archive_name.split('/')[1:]
        
        if parts[0] == '' and len(parts) > 1:
          parts = parts[1:]
          
        if len(parts) > 1 and parts[0] == 'Contents' and len(parts[-1]) > 0 and parts[-1][0] != '.':
          stage_path = Core.storage.join_path(self.stage, identifier)
          file_path = Core.storage.join_path(stage_path, *parts)
          dir_path = Core.storage.join_path(stage_path, *parts[:-1])
          
          if check_platform and not self.platform_needs_file(parts):
            Log("Skipping %s (not required for current platform)", archive_name)

          else:
            if not Core.storage.dir_exists(dir_path):
              Core.storage.make_dirs(dir_path)
            Core.storage.save(file_path, archive[archive_name])
            Log("Extracted %s to %s for %s" % (parts[-1], dir_path, identifier))
        else:
          Log("Not extracting %s" % archive_name)

    except:
      Log("Error extracting archive of %s" % identifier)
      Log(Plugin.Traceback())
      self.unstage(identifier)
      return False
    
    finally:
      archive.Close()
    
    self.deactivate(identifier)
    if not self.activate(identifier, name):
      Log("Unable to activate %s" % identifier)
      if not self.reactivate(identifier):
        Log.Critical("Unable to reactivate %s" % identifier)
      self.unstage(identifier)
      return False

    self.unstage(identifier)
    self.cleanup(identifier)
    
    return True
        

  def install(self, identifier):
    if identifier not in self.system.storeservice.plugins:
      Log("Plug-in %s could not be found", identifier)
      return False
    
    Log("Performing a full installation of %s" % identifier)
    
    plugin = self.system.storeservice.plugins[identifier]
    stage_path = self.setup_stage(identifier)
    
    if plugin.beta == True:
      version = 'beta'
    else:
      version = 'current'
    
    remoteUrl = "%s/apps/%s/versions/%s/download" % (AS_URL, plugin.identifier, version)
    
    # Make sure we only perform the platform check on v2 plug-ins
    check_platform = (plugin.framework_version == "2")
    
    if not self.install_zip_from_url(identifier, plugin.name, remoteUrl, check_platform):
      return False
      
    self.add_history_record(identifier, "Plug-in installed")
    
    # Check whether this bundle contains services & instruct other plug-ins to reload if necessary
    self.system.bundleservice.update_bundles()
    self.check_if_service_reload_required([identifier])
    
    Log("Installation of %s complete" % identifier)
    return True
    
  
  def update(self, identifier):
    if identifier not in self.system.storeservice.plugins:
      Log("Plug-in %s could not be found" % identifier)
      return False

    plugin = self.system.storeservice.plugins[identifier]
    if not plugin.is_installed:
      Log("Unable to update %s because it isn't installed." % identifier)
      return False
    
    bundle = self.system.bundleservice.bundles[identifier]
    
    # Make sure we only perform the platform check on v2 plug-ins
    check_platform = (plugin.framework_version == "2")
    
    try:
      stage_path = self.setup_stage(identifier)
      Log("Updating an existing installation of %s at %s" % (identifier, stage_path))

      if plugin.beta == True:
        version = 'beta'
      else:
        version = 'current'
        
      info_url = "%s/apps/%s/versions/%s.json" % (AS_URL, plugin.identifier, version)
      info_dict = JSON.ObjectFromURL(info_url, cacheTime=0)['version']
      for appFile in info_dict['app_files']:
        file_path = appFile['path']
        if file_path[-4:] != '.pyc' and file_path[0] != '.':
          parts = file_path.split('/')[6:]
          inner_path = '/'.join(parts)
          
          if check_platform and not self.platform_needs_file(parts):
            Log("Skipping %s (not required for current platform)", inner_path)
            
          else:
            remote_path = AS_URL + file_path.replace(' ', '%20')
            local_path = Core.storage.join_path(bundle.path, inner_path)
            fileStage_path = Core.storage.join_path(stage_path, inner_path)

            Core.storage.make_dirs(Core.storage.dir_name(fileStage_path))

            remoteHash = appFile['checksum']
            if Core.storage.file_exists(local_path):
              localHash = Hash.SHA1(Core.storage.load(local_path))
            else:
              localHash = ''

            if localHash == remoteHash:
              Log("Existing file %s is identical to the remote version - using local file." % inner_path)
              Core.storage.copy(local_path, fileStage_path)
            else:
              Log("File %s has changed - downloading new version." % inner_path)
              data = HTTP.Request(remote_path, cacheTime=0)
              Core.storage.save(fileStage_path, data)
        else:
          pass
          #Log("WARNING: Remote version contains a compiled file (%s). The bundle signature will be broken. Please alert the Plex development team." % file_path[file_path.rfind('/')+1:])

      self.deactivate(identifier)
      if not self.activate(identifier, plugin.name):
        Log("Unable to activate the updated version of %s" % identifier)
        self.unstage(identifier)
        return False
        
      # Update the bundle hash
      self.system.bundleservice.bundles[identifier].update_hash()
      
      # Check if service reloads are required
      self.check_if_service_reload_required([identifier])
      
      # Add a record to the update history
      self.add_history_record(identifier, "Plug-in updated", info_dict['version'], info_dict['release_notes'])
      
      Log("Update of %s complete" % identifier)
      return True

    except:
      Log(Plugin.Traceback())
      return False

    finally:
      self.unstage(identifier)
      self.cleanup(identifier)

  def restart(self, identifier):
    if identifier in self.system.bundleservice.bundles:
      bundle = self.system.bundleservice.bundles[identifier]
      plist_path = Core.storage.join_path(self.system.bundleservice.plugins_path, bundle.name, "Contents", "Info.plist")
      if Core.storage.file_exists(plist_path):
        Log("Restarting %s" % identifier)
        Core.storage.utime(plist_path, None)
        return True
    return False

  def reset(self, identifier):
    Log("Resetting all stored data for %s" % identifier)
    Core.storage.remove_tree(Core.storage.join_path(Core.plugin_support_path, "Data", identifier))
    Core.storage.remove_tree(Core.storage.join_path(Core.plugin_support_path, "Preferences", identifier + ".xml"))
    Core.storage.remove_tree(Core.storage.join_path(Core.plugin_support_path, "Databases", identifier + ".db"))
    return self.restart(identifier)
    
  def uninstall(self, identifier):
    Log("Attempting to uninstall %s..." % identifier)
    if not self.deactivate(identifier):
      Log("Existing installation of %s couldn't be deactivated" % identifier)
      result = False
    else:
      result = True

    self.cleanup(identifier)
    
    # Reload services
    self.reload_services_in_running_plugins()
    
    self.add_history_record(identifier, "Plug-in uninstalled")
    return result
    
  def update_available_from_feed(self, identifier, cacheTime=3600):
    try:
      bundle = self.system.bundleservice.bundles[identifier]
      if bundle.update_feed == None:
        return False
      url = bundle.update_feed + 'BundleInfo'
      info = XML.ElementFromURL(url, cacheTime=cacheTime)
      local_hash = bundle.hash
      remote_hash = info.xpath('//CompositeHash')[0].text
      return local_hash != remote_hash
      
    except:
      Log.Error("Exception getting third party update information for '%s'", identifier)
    
  def third_party_updates(self, now=False):
    update_list = []
    
    if now:
      cacheTime = 0
    else:
      cacheTime = 3600
    
    for identifier in self.system.bundleservice.bundles:
      bundle = self.system.bundleservice.bundles[identifier]
      
      # If the bundle is managed by Plex Online, ignore it
      if bundle.managed:
        continue
        
      # If the bundle has an update feed, check whether updates are required
      if bundle.update_feed != None:
        if self.update_available_from_feed(identifier, cacheTime):
          update_list.append(identifier)
          
    return update_list
    
  def install_third_party_update(self, identifier):
    bundle = self.system.bundleservice.bundles[identifier]
    if bundle.update_feed == None:
      return False
    url = bundle.update_feed + 'BundleData'
    info_url = bundle.update_feed + 'BundleInfo'
    name = bundle.name[:-7]
    
    info = XML.ElementFromURL(info_url, cacheTime=3600)
    notes = info.xpath('//ReleaseNotes')[0].text
    
    Log("Installing a third-party update of %s" % identifier)
    
    # Don't perform platform checks for now
    if self.install_zip_from_url(identifier, name, url, False):
      bundle.update_hash()
      self.add_history_record(identifier, "Third party plug-in updated", notes=notes)
      Log("Installation of %s complete" % identifier)
      return True
      
    else:
      return False
    
  def install_updates(self, updates=None):
    if self.installing:
      return ALREADY_INSTALLING
    
    self.installing = True
    try:
      # If no updates were provided, get a list of all available updates
      if not updates:
        updates = self.system.storeservice.available_updates()

      system_updates = []
      normal_updates = []
    
      # Check for framework updates first
      if 'com.plexapp.framework' in updates:
        if self.update('com.plexapp.framework') == False:
          return UPDATE_FAILED
        
        # If the framework updated, check for system or service bundle updates and (if available) install them
        # before restarting
        if 'com.plexapp.system' in updates:
          if self.update('com.plexapp.system') == False:
            return UPDATE_FAILED
        
        if 'com.plexapp.system.services' in updates:
          if self.update('com.plexapp.system.services') == False:
            return UPDATE_FAILED
        
        return FRAMEWORK_UPDATE_COMPLETE

      # Check for services updates released independently of framework/system
      if 'com.plexapp.system.services' in updates:
        if self.update('com.plexapp.system.services') == False:
          return UPDATE_FAILED
        else:
          self.reload_services_in_running_plugins()
          return SYSTEM_UPDATE_COMPLETE


      # Check for updates to installed plug-ins
      for identifier in updates:
        if identifier in self.system.storeservice.plugins:
          plugin = self.system.storeservice.plugins[identifier]
          if plugin.is_system or identifier == Plugin.Identifier:
            system_updates.append(identifier)
          else:
            normal_updates.append(identifier)

      # Check for required plug-ins that aren't installed
      for identifier in self.system.storeservice.required_apps:
        if identifier in self.system.storeservice.plugins:
          plugin = self.system.storeservice.plugins[identifier]
          if not plugin.is_installed and not (identifier in system_updates or identifier in normal_updates):
            if plugin.is_system:
              system_updates.append(identifier)
            else:
              normal_updates.append(identifier)
              
      # Check for third-party plug-in updates
      third_party_updates = self.third_party_updates()
      
      # Check for revoked plug-ins
      for identifier in self.system.storeservice.revoked_apps:
        plugin = self.system.storeservice.plugins[identifier]
        if plugin.is_installed:
          Log("Plug-in '%s' has been revoked and will be uninstalled.")
          self.uninstall(identifier)
      
      # If there are system updates, install them first then restart
      if len(system_updates) > 0:
        for identifier in system_updates:
          if plugin.is_installed:
            if not self.update(identifier):
              return UPDATE_FAILED
          else:
            if not self.install(identifier):
              return UPDATE_FAILED
        return SYSTEM_UPDATE_COMPLETE

      # Install regular plug-ins
      for identifier in normal_updates:
        if plugin.is_installed:
          if not self.update(identifier):
            return UPDATE_FAILED
        else:
          if not self.install(identifier):
            return UPDATE_FAILED
            
      # Install third-party updates
      for identifier in third_party_updates:
        if not self.install_third_party_update(identifier):
          return UPDATE_FAILED
      
      # Check if we need to reload services
      self.system.bundleservice.update_bundles()
      self.check_if_service_reload_required(normal_updates)
      
      return ALL_UPDATES_COMPLETE
    
    finally:
      self.installing = False
    
  def restart_and_continue_updating(self):
    Thread.Sleep(2)

    host = Request.Headers.get('Host', '127.0.0.1:32400')
    return Redirect('http://%s/:/plugins/com.plexapp.system/restart?url=/system/appstore/updates/install' % host)
  
  def restart_self_silently(self):
    HTTP.Request('http://127.0.0.1:32400/:/plugins/com.plexapp.system/restart', immediate=True)
  
  def restart_running_plugins(self):
    Thread.Sleep(2)
    plugins_list = XML.ElementFromURL('http://127.0.0.1:32400/:/plugins', cacheTime=0)
    for plugin_el in plugins_list.xpath('//Plugin'):
      if str(plugin_el.get('state')) == '0':
        ident = str(plugin_el.get('identifier'))
        if ident != "com.plexapp.system":
          Log("Plug-in %s is currrently running with old framework code - restarting", ident)
          self.restart(ident)
          
  def check_if_service_reload_required(self, identifiers):
    """ Check the list of bundle identifiers to see if any of the bundles contain services. If they do, instruct running plug-ins to reload their service list. """
    bundles = self.system.bundleservice.bundles
    for ident in identifiers:
      if ident in bundles:
        bundle = bundles[ident]
        if bundle.has_services:
          Log("At least one bundle containing services has been updated - instructing all running plug-ins to reload.")
          self.reload_services_in_running_plugins()
          return
    Log("No bundles containing services have been updated.")
      
  
  def reload_services_in_running_plugins(self):
    """ Get the list of plug-ins from PMS, and tell any that are running to reload services """
    plugins_list = XML.ElementFromURL('http://127.0.0.1:32400/:/plugins', cacheTime=0)
    for plugin_el in plugins_list.xpath('//Plugin'):
      if str(plugin_el.get('state')) == '0':
        ident = str(plugin_el.get('identifier'))
        if ident != "com.plexapp.system":
          try:
            Log("Plug-in %s is currrently running with old service code - reloading", ident)
            HTTP.Request('http://127.0.0.1:32400/:/plugins/%s/reloadServices' % ident, cacheTime=0, immediate=True)
          except:
            Log.Error("Unable to reload services in %s", ident)
            
    # Reload system services
    Core.services.load()
    
    
  def install_updates_silently(self, updates=None):
    ret = self.install_updates(updates)
    if ret == FRAMEWORK_UPDATE_COMPLETE:
      Log("Restarting after a silent framework update")
      
      # The framework updated, so try to restart all running plug-ins so they're using the latest code.
      try:
        self.restart_running_plugins()
      except:
        Log.Exception('Exception restarting running plug-ins')
        
      self.restart_self_silently()
      
    if ret == SYSTEM_UPDATE_COMPLETE:
      Log("Restarting after a silent system update")
      self.restart_self_silently()

  """ Functions for interacting with the installer via the GUI """
  def update_data(self):
    self.system.bundleservice.update_bundles()
    self.system.storeservice.update(now=True)
    
  def gui_install(self, identifier):
    self.update_data()
    result = self.install(identifier)
    self.system.bundleservice.update_bundles()
    
    for x in range(15):
      try:
        HTTP.Request('http://127.0.0.1:32400/:/plugins/%s/root' % identifier, cacheTime=0).content
        break
      except:
        Log.Debug("Unable to reach %s - waiting and trying again" % identifier)
        Thread.Sleep(2)
    
    if result:
      return MessageContainer(L('AS_MSG_INSTALL_SUCCESS_T'), F('AS_MSG_INSTALL_SUCCESS_B', self.system.storeservice.plugins[identifier].name), code=0)
    else:
      plugins = self.system.storeservice.plugins
      if identifier in plugins:
        fmt = plugins[identifier].name
      else:
        fmt = identifier
      return MessageContainer(L('AS_MSG_INSTALL_FAIL_T'), F('AS_MSG_INSTALL_FAIL_B', fmt), code=1)
    
  
  def gui_update(self, identifier): 
    self.update_data()
    
    plugin = self.system.storeservice.plugins[identifier]
    plugin_name = plugin.name
    plugin_hash = plugin.hash
    
    if identifier not in self.system.bundleservice.bundles:
      Log("Unable to find %s bundle for updating" % identifier)
      return MessageContainer(L('AS_MSG_UPDATE_FAIL_T'), F('AS_MSG_UPDATE_FAIL_B', plugin_name))

    bundle = self.system.bundleservice.bundles[identifier]
    
    if plugin_hash == bundle.hash:
      return MessageContainer(L('AS_MSG_NO_UPDATE_T'), F('AS_MSG_NO_UPDATE_B', plugin_name))

    result = self.update(identifier)
    self.system.storeservice.update()
    if result:
      return MessageContainer(L('AS_MSG_UPDATE_SUCCESS_T'), F('AS_MSG_UPDATE_SUCCESS_B', plugin_name))
    else:
      return MessageContainer(L('AS_MSG_UPDATE_FAIL_T'), F('AS_MSG_UPDATE_FAIL_B', plugin_name))
    
    
  def gui_restart(self, identifier): 
    self.update_data()
    result = self.restart(identifier)
    self.system.storeservice.update()
    plugin = self.system.storeservice.plugins[identifier]
    if result:
      return MessageContainer(L('AS_MSG_RESTART_SUCCESS_T'), F('AS_MSG_RESTART_SUCCESS_B', plugin.name))
    else:
      return MessageContainer(L('AS_MSG_RESTART_FAIL_T'), F('AS_MSG_RESTART_FAIL_B', plugin.name))
      
  def gui_reset(self, identifier):
    self.system.bundleservice.update_bundles()
    result = self.reset(identifier)
    self.system.storeservice.update()
    plugin = self.system.storeservice.plugins[identifier]
    if result:
      return MessageContainer(L('AS_MSG_RESET_SUCCESS_T'), F('AS_MSG_RESET_SUCCESS_B', plugin.name))
    else:
      return MessageContainer(L('AS_MSG_RESET_FAIL_T'), F('AS_MSG_RESET_FAIL_B', plugin.name))
    
  def gui_uninstall(self, identifier):
    self.update_data()
    result = self.uninstall(identifier)
    self.system.storeservice.update()
    plugin = self.system.storeservice.plugins[identifier]
    if result:
      return MessageContainer(L('AS_MSG_UNINSTALL_SUCCESS_T'), F('AS_MSG_UNINSTALL_SUCCESS_B', plugin.name), code=0)
    else:
      return MessageContainer(L('AS_MSG_UNINSTALL_FAIL_T'), F('AS_MSG_UNINSTALL_FAIL_B', plugin.name), code=1)
      
  def gui_install_all_updates(self):
    result = self.install_updates()
    
    if result == FRAMEWORK_UPDATE_COMPLETE:
      Log("Framework update complete")
      self.restart_running_plugins()
      Log("Restarting System after a framework update - update chain will continue running in the new instance")
      return self.restart_and_continue_updating()
    if result == SYSTEM_UPDATE_COMPLETE:
      Log("Restarting System after an update - update chain will continue running in the new instance")
      return self.restart_and_continue_updating()
      
    d = self.system.storeservice.gui_more_menu(goBack='1')
    d.noHistory=True
    if result == ALL_UPDATES_COMPLETE:
      d.code = '0'
      d.header = L('AS_MSG_UPDATE_SUCCESS_T')
      d.message = L('AS_MSG_UPDATE_ALL_SUCCESS_B')
    elif result == ALREADY_INSTALLING:
      d.code = '1'
      d.header = L('AS_MSG_ALREADY_INSTALLING_T')
      d.header = L('AS_MSG_ALREADY_INSTALLING_B')
    else:
      d.code = '2'
      d.header = L('AS_MSG_UPDATE_PROBLEM_T')
      d.message = L('AS_MSG_UPDATE_PROBLEM_B')
    return d
    
  def gui_update_history_menu(self):
    name_substitutions = self.system.storeservice.name_substitutions
    d = MediaContainer(title1=L("AS_TITLE"), title2=L("AS_HISTORY"), art=R('store-art.png'), viewGroup="Store:Info")
    try:
      self.history_lock.acquire()
      for info in self.history:
        if info[IDENTIFIER_KEY] in self.system.storeservice.plugins:
          plugin = self.system.storeservice.plugins[info[IDENTIFIER_KEY]]
          title = plugin.name if plugin.name not in name_substitutions else name_substitutions[plugin.name]
          thumb = plugin.icon
        else:
          title = info[IDENTIFIER_KEY]
          thumb = None
        item = DirectoryItem("none", title, subtitle=info[DATE_KEY].strftime("%Y-%m-%d %H:%M:%S"), thumb=thumb)
        summary = info[ACTION_KEY]
        if VERSION_KEY in info:
          summary = summary + "\n\nVersion: %s" % info[VERSION_KEY]
        if NOTES_KEY in info:
          summary = summary + "\n\nRelease notes:\n%s" % info[NOTES_KEY]
        item.summary = summary
        d.Append(item)
        
    finally:
      self.history_lock.release()
      
    d.Reverse()
    return d
      