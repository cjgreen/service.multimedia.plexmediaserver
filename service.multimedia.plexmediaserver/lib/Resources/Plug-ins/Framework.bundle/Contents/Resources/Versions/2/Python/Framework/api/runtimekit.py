#
#  Plex Extension Framework
#  Copyright (C) 2008-2012 Plex, Inc. (James Clarke, Elan Feingold). All Rights Reserved.
#

import Framework
import os, sys

from base import BaseKit


class RouteKit(BaseKit):

  _included_policies = [
    Framework.policies.BundlePolicy,
  ]


  # TODO: Add support for routes in services
  def _init(self):
    self._publish(self._connect_route_decorator, 'route')

    
  def _connect_route_decorator(self, path, method='GET', allow_sync=False, **kwargs):
    def connect_route_decorator_inner(f):
      self.Connect(path, f, method, allow_sync=allow_sync, **kwargs)
      return f
    return connect_route_decorator_inner

    
  def _generate_route(self, f, method='GET', **kwargs):
    return self._core.runtime.generate_route(f, method, **kwargs)

    
  def __call__(self, f, method='GET', **kwargs):
    return self._generate_route(f, method, **kwargs)

    
  def Connect(self, path, f, method=['GET'], allow_sync=False, **kwargs):
    """
      Provides equivalent functionality to the *route* decorator, but allows instance methods
      of objects to be added as routes as well as unbound functions.
    """
    if path[0] != '/': path = '/' + path
    if self._sandbox.policy.synthesize_defaults: path = self._core.channel_prefix + path
    return self._core.runtime.connect_route(path, f, method, allow_sync=allow_sync, **kwargs)



class RequestKit(BaseKit):

  _included_policies = [
    Framework.policies.BundlePolicy,
  ]

  _excluded_policies = [
    Framework.policies.CloudPolicy,
  ]

  
  def _warn(self, attr_info):
    self._core.log.warn('Attempting to access %s outside a request context', attr_info)

    
  @property
  def Headers(self):
    """
      A dictionary of the HTTP headers received by the plug-in for the current request.
      
      :rtype: dict
    """
    if self._context.request:
      return self._context.request.headers
    else:
      self._warn('request headers')
      return {}

      
  @property
  def Body(self):
    if self._context.request:
      return self._context.request.body
    else:
      self._warn('POST body')
      return ""
      

  @property
  def Method(self):
    if self._context.request:
      return self._context.request.method
    else:
      self._warn('request method')
      return ""

    
    
class ResponseKit(BaseKit):

  _included_policies = [
    Framework.policies.BundlePolicy,
  ]

  _excluded_policies = [
    Framework.policies.CloudPolicy,
  ]


  @property
  def Headers(self):
    """
      A dictionary of keys and values that will be returned to the client as HTTP headers::
      
        HTTP.Headers['MyHeader'] = 'MyValue'
    """
    return self._context.response_headers
      

  @property
  def Status(self):
    """
      An integer value specifying the `HTTP status code <http://en.wikipedia.org/wiki/List_of_HTTP_status_codes>`_
      of the response.
    """
    return self._context.response_status
      
  @Status.setter
  def Status(self, status):
    self._context.response_status = status
    


class ClientKit(BaseKit):

  _included_policies = [
    Framework.policies.BundlePolicy,
    Framework.policies.ServicePolicy,
  ]


  @property
  def Platform(self):
    """
      Reports the platform of the client currently accessing the plug-in.
      
      :returns: The client platform; one of the constants defined in :mod:`ClientPlatform`.
      :rtype: str
    """
    if self._context == None:
      self._core.log.error('Client platform information is unavailable in this context.')
      return None
    return self._context.platform


  @property
  def Product(self):
    """
      Reports the client product currently accessing the plug-in.

      :returns: The client product.
      :rtype: str
    """
    if self._context == None:
      self._core.log.error('Client platform information is unavailable in this context.')
      return None
    return self._context.product


  @property
  def Version(self):
    """
      Reports the version of the client currently accessing the plug-in.
      
      :returns: The client platform; one of the constants defined in :mod:`ClientPlatform`.
      :rtype: str
    """
    if self._context == None:
      self._core.log.error('Client version information is unavailable in this context.')
      return None
    return self._context.client_version


  @property
  def Protocols(self):
    """
      Reports the protocols supported by the client currently accessing the plug-in.
      
      :returns: A list of protocols supported by the client, containing constants defined in :mod:`Protocol`.
      :rtype: list
    """
    if self._context == None:
      self._core.log.error('Client protocol information is unavailable in this context.')
      return []
    return self._context.protocols
    


class PluginKit(BaseKit):

  _included_policies = [
    Framework.policies.BundlePolicy,
  ]


  def _init(self):
    self._publish(self._handler_decorator, name='handler')

  
  @property
  def Identifier(self):
    """
      A read-only attribute containing the identifier of the plug-in.

      :rtype: str
    """
    return self._core.identifier
    

  @property
  @BaseKit._include_in(Framework.policies.ModernPolicy)
  @BaseKit._exclude_from(Framework.policies.ServicePolicy)
  def Title(self):
    """
      A read-only attribute containing the plug-in's title.

      :rtype: str
    """
    return self._core.title
    

  @property
  @BaseKit._include_in(Framework.policies.ModernPolicy)
  @BaseKit._exclude_from(Framework.policies.ServicePolicy)
  def IconResourceName(self):
    """
      A read-only attribute containing the name of the plug-in's icon image resource file.

      :rtype: str
    """
    return self._core.icon_resource_name
    

  @property
  @BaseKit._include_in(Framework.policies.ModernPolicy)
  @BaseKit._exclude_from(Framework.policies.ServicePolicy)
  def ArtResourceName(self):
    """
      A read-only attribute containing the name of the plug-in's background art image resource file.

      :rtype: str
    """
    return self._core.art_resource_name
    

  @property
  @BaseKit._include_in(Framework.policies.ModernPolicy)
  @BaseKit._exclude_from(Framework.policies.ServicePolicy)
  def TitleBarResourceName(self):
    """
      A read-only attribute containing the name of the plug-in's title bar image resource file.

      :rtype: str
    """
    return self._core.title_bar_resource_name
    

  @BaseKit._exclude_from(Framework.policies.ModernPolicy)
  def AddPrefixHandler(self, prefix, handler, name, thumb=None, art=None, titleBar=None, share=False):
    self._core.runtime.add_prefix_handler(prefix, handler, name, thumb, art, titleBar, share)
    

  @BaseKit._exclude_from(Framework.policies.ModernPolicy)
  def AddViewGroup(self, name, viewMode="List", mediaType="items", type=None, menu=None, cols=None, rows=None, thumb=None, summary=None):
    self._core.runtime.add_view_group(name, viewMode, mediaType, type, menu, cols, rows, thumb, summary)
    

  @BaseKit._exclude_from(Framework.policies.ModernPolicy)
  def _handler_decorator(self, prefix, name, thumb=None, art=None, titleBar=None, share=False, allow_sync=False):
    def handler_decorator_inner(f):
      self._core.runtime.add_prefix_handler(prefix, f, self._core.localization.local_string(name), thumb, art, titleBar, share, allow_sync)
      return f
    return handler_decorator_inner
    

  @property
  @BaseKit._exclude_from(Framework.policies.ModernPolicy)
  def Prefixes(self):
    """
      Returns a list of all prefixes currently registered by the plug-in.

    	:rtype: list
  	"""
    return [handler.prefix for handler in self._core.runtime._handlers if isinstance(handler, Framework.handlers.PrefixRequestHandler)]
    

  @property
  @BaseKit._exclude_from(Framework.policies.ModernPolicy)
  def ViewGroups(self):
    return dict(self._core.runtime.view_groups)
    

  def Traceback(self, msg='Traceback'):
    return self._core.traceback(msg)


  @BaseKit._exclude_from(Framework.policies.ModernPolicy)
  def Nice(self, value):
    """
      Alters the plug-in's 'niceness' level, which affects how system resources are allocated. The
      higher the value, the fewer resources will be given to this plug-in, allowing other plug-ins
      and applications to make use of them instead.

      The value should be between 0 (the default) and 20.

      :arg value: The level of 'niceness' to apply
      :type value: int
    """
    if sys.platform == "win32":
      return
    if (value < 0):
      value = 0
    nice_inc = value - os.nice(0)
    os.nice(nice_inc)



class PlatformKit(BaseKit):

  _included_policies = [
    Framework.policies.BundlePolicy,
    Framework.policies.ServicePolicy,
  ]

  _excluded_policies = [
    Framework.policies.CloudPolicy,
  ]


  def _init(self):
    self._mimetypes = []

    if self.OS == 'MacOSX':
      self._add_mac_mimetypes()
    elif self.OS == 'Windows':
      self._add_win_mimetypes()


  def _add_mac_mimetypes(self):
    # TODO(schuyler): It would be more correct to iterate over all .plugin
    # bundles in these two paths and look at the WebPluginMIMETypes in
    # Info.plist.
    plugins = [
      ("Silverlight.plugin", "application/x-silverlight"),
      ("Flash Player.plugin", "application/x-shockwave-flash"),
    ]
    for bundle, mime in plugins:
      if (os.path.exists("/Library/Internet Plug-Ins/%s" % bundle) or
          os.path.exists(os.path.expanduser("~/Library/Internet/Plug-Ins/%s" % bundle))):
        self._mimetypes.append(mime)


  def _add_win_mimetypes(self):
    try:
      import _winreg
    except ImportError:
      return

    hives = (_winreg.HKEY_LOCAL_MACHINE, _winreg.HKEY_CURRENT_USER)
    for hive in hives:
      handle, plugins = self._get_registry_subkeys(hive, r"Software\MozillaPlugins")
      for plugin in plugins:
        # TODO(schuyler): The MIME types will either be stored as registry
        # keys or embedded in the DLL. Extracting it from the DLL requires
        # win32api and probably isn't worth it as long as we only care about
        # Flash and Silverlight.
        if plugin.find("FlashPlayer") > -1:
          self._mimetypes.append("application/x-shockwave-flash")
        elif plugin.find("NpCtrl") > -1:
          self._mimetypes.append("application/x-silverlight")
        handle2, mimes = self._get_registry_subkeys(handle, r"%s\MimeTypes" % plugin)
        self._mimetypes.extend(mimes)


  def _get_registry_subkeys(self, key, subkey):
    try:
      import _winreg
    except ImportError:
      return None, []

    handle = None
    keys = []
    try:
      flags = _winreg.KEY_ENUMERATE_SUB_KEYS | _winreg.KEY_WOW64_32KEY
      handle = _winreg.OpenKey(key, subkey, 0, flags)
      i = 0
      while True:
        keys.append(_winreg.EnumKey(handle, i))
        i += 1
    except WindowsError:
      pass
    return handle, keys


  @property
  def HasSilverlight(self):
    """
      Reports whether the server supports playback of Silverlight video content.
      
      :rtype: bool
    """
    return "application/x-silverlight" in self._mimetypes


  @property
  def HasFlash(self):
    """
      Reports whether the server supports playback of Flash video content.
      
      :rtype: bool
    """
    return "application/x-shockwave-flash" in self._mimetypes
    

  @property
  def HasWebKit(self):
    """
      Reports whether the server supports video playback via the WebKit engine.
      
      :rtype: bool
    """
    webkit = self._core.get_server_attribute("webkit")
    return webkit == "1" or self.OS == 'MacOSX'


  @property
  def OS(self):
    """
      Reports the current server's operating system.
      
      :returns: The current platform; either `MacOSX`, `Windows` or `Linux`.
      :rtype: str
    """
    return self._core.runtime.os
    

  @property
  def OSVersion(self):
    """
      Reports the current server's operating system version.
      
      :returns: The version of the current platform, e.g. `10.7.0`
      :rtype: str
    """
    return self._core.get_server_attribute('platformVersion', 'Unknown')


  @property
  def CPU(self):
    """
      Reports the current server's CPU architecture.
      
      :returns: The current CPU architecture; either `i386`, `MIPS`, `mips64` or `armv5tel`.
      :rtype: str
    """
    return self._core.runtime.cpu
    

  @property
  def MachineIdentifier(self):
    """
      Reports the current server's machine identifier.
      
      :returns: The unique identifier for the server.
      :rtype: str
    """
    
    return self._core.get_server_attribute('machineIdentifier')
    

  @property
  def ServerVersion(self):
    """
      Reports the current server's version string.

      :returns: The version the server.
      :rtype: str
    """

    return self._core.get_server_attribute('serverVersion')



class PrefsKit(BaseKit):

  _included_policies = [
    Framework.policies.BundlePolicy,
    Framework.policies.ServicePolicy,
  ]

  _excluded_policies = [
    Framework.policies.CloudPolicy,
  ]
  

  def __getitem__(self, name):
    return self._sandbox.preferences.get()[name]



class RuntimeKit(BaseKit):
  
  _root_object = False

  _included_policies = [
    Framework.policies.CodePolicy,
  ]

  _children = [
    PluginKit,
    ClientKit,
    PlatformKit,
    RouteKit,
    RequestKit,
    ResponseKit,
    PrefsKit,
  ]

  
  def _init(self):
    self._publish(Framework.components.runtime.IndirectFunction, name='indirect')
    self._publish(Framework.components.runtime.DeferredFunction, name='deferred', excluded_policies=[Framework.policies.CloudPolicy])
    self._publish(Framework.exceptions, name='Ex')
    self._publish(self._core.runtime.generate_callback_path, 'Callback')

