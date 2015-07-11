import urllib, re, os
from xml.dom import minidom
import Media, AudioFiles

Virtual = True

def Scan(path, files, mediaList, subdirs, language=None, root=None):
  if len(path) == 0:

    # Top level, albums.
    dom = minidom.parse(urllib.urlopen('http://127.0.0.1:32400/music/iTunes/Albums'))
    for album in sorted(dom.getElementsByTagName('Album'), key=lambda album: album.getAttribute('artist').lower() + album.getAttribute('album').lower()):

      # Tracks.
      path = album.getAttribute('key')
      dom = minidom.parse(urllib.urlopen('http://127.0.0.1:32400/music/iTunes/Albums/%s' % path))
      artist_album_map = {}
      compilation_count = 0
      
      for track in dom.getElementsByTagName('Track'):

        # Figure out album artist.
        album_artist = track.getAttribute('albumArtist').strip()
        artist_album_map[album_artist] = True
        if len(album_artist) == 0: album_artist = None
        else: album_artist = album_artist.encode('utf-8')

        # Compilation handling.
        if track.getAttribute('compilation') == '1': 
          album_artist = 'Various Artists' 
          title = track.getAttribute('artist').encode('utf-8') + ' - ' + track.getAttribute('track').encode('utf-8')
        else: 
          title = track.getAttribute('track').encode('utf-8')   

        # Track index.
        index = int(track.getAttribute('index'))
        path = cleanPass(track.getAttribute('file'))
        if index == 0:
          try: index = int(re.findall('[.\-]+[ ]*([0-9]{2})[ ]*[.\-]', os.path.basename(path))[0])
          except: 
            try: index = int(re.findall('^([0-9]{2})[ .\-]', os.path.basename(path))[0])
            except: pass

        # Add the track.
        t = Media.Track(artist = track.getAttribute('artist').encode('utf-8'),
                        album = track.getAttribute('album').encode('utf-8'),
                        title = track.getAttribute('track').encode('utf-8'),
                        index = index,
                        album_artist = album_artist,
                        disc = int(track.getAttribute('disc')))
        t.parts.append(urllib.unquote(path))
        mediaList.append(t)

def cleanPass(t):
  try:
    t = re.sub(RE_UNICODE_CONTROL, '', t.strip().encode('utf-8'))
  except:
    pass
  return t