#
# Copyright (c) 2014 Plex Development Team. All rights reserved.
#

from urllib import quote
from Utils import normalize_artist_name

FANART_TV_API_KEY = '72519ab36caf49c09f69a028fb7f741d'
FANART_TV_ARTIST_URL = 'http://webservice.fanart.tv/v3/music/%s' # TODO: Cloudflare this.
FANART_TV_PREVIEW_URL = '%s/preview.jpg'

MB_ARTIST_URL = 'http://musicbrainz.plex.tv/ws/2/artist/%s'
MB_RELEASE_URL = 'http://musicbrainz.plex.tv/ws/2/release/%s?inc=release-groups'
MB_NS = {'a': 'http://musicbrainz.org/ns/mmd-2.0#'}
MB_HEADERS = {'User-Agent':'Plex Music Agent/1.0 (http://plex.tv)'}

HTBACKDROPS_API_KEY = '15f8fe4ad7760d77c85e686eefafd26f'
HTBACKDROPS_MBID_SEARCH_URL = 'http://htbackdrops.org/api/%s/searchXML?mbid=%%s&default_operator=and&limit=50&aid=1' % HTBACKDROPS_API_KEY
HTBACKDROPS_KEYWORD_SEARCH_URL = 'http://htbackdrops.org/api/%s/searchXML?keywords=%%s&default_operator=and&limit=50&aid=1' % HTBACKDROPS_API_KEY
HTBACKDROPS_THUMB_URL = 'http://htbackdrops.org/api/%s/download/%%s/thumbnail' % HTBACKDROPS_API_KEY
HTBACKDROPS_FULL_URL = 'http://htbackdrops.org/api/%s/download/%%s/fullsize' % HTBACKDROPS_API_KEY

def find_lastfm_artist(artist, album_titles, lang):
    try: return Core.messaging.call_external_function('com.plexapp.agents.lastfm', 'MessageKit:ArtistSearch', kwargs = dict(artist=artist, albums=album_titles, lang=lang))
    except: return None

def find_lastfm_top_tracks(artist, lang):
    try: return Core.messaging.call_external_function('com.plexapp.agents.lastfm', 'MessageKit:ArtistTopTracks', kwargs = dict(artist=artist['name'], lang=lang))
    except: return None

def find_lastfm_similar_artists(artist, lang):
    try: return Core.messaging.call_external_function('com.plexapp.agents.lastfm', 'MessageKit:ArtistGetSimilar', kwargs = dict(artist=artist['name'], lang=lang))
    except: return None

def find_lastfm_events(artist, lang):
    try: return Core.messaging.call_external_function('com.plexapp.agents.lastfm', 'MessageKit:ArtistGetEvents', kwargs = dict(artist=artist['name'], lang=lang))
    except: return None
    
def find_lastfm_album(artist, album, year, lang):
    try: return Core.messaging.call_external_function('com.plexapp.agents.lastfm', 'MessageKit:AlbumSearch', kwargs = dict(artist=artist['name'], album=album, year=year, lang=lang))
    except: return None

def find_htbackdrops_artist(artist):
    try: return Core.messaging.call_external_function('com.plexapp.agents.htbackdrops', 'MessageKit:ArtistSearch', kwargs = dict(artist_name=artist))
    except: return None

def artist_mbid_lookup(artist, lastfm_artist):
  artist_mbid = None
  if lastfm_artist and 'mbid' in lastfm_artist and len(lastfm_artist['mbid']) == 36:  # Sanity check.
    artist_mbid = lastfm_artist['mbid']

    # See if there's an updated MBID.
    try: artist_mbid = XML.ElementFromURL(MB_ARTIST_URL % lastfm_artist['mbid'], headers=MB_HEADERS).xpath('//a:artist/@id', namespaces=MB_NS)[0]
    except: pass

  if artist_mbid is not None:
    Log('Found MBID: %s' % artist_mbid)
  else:
    Log('Couldn\'t find MBID.')

  return artist_mbid

def find_fanart_artist(artist, mbid):
  fanart_artist = None
  if mbid is not None:
    try:
      fanart_artist = JSON.ObjectFromURL(FANART_TV_ARTIST_URL % mbid, headers={'api-key':FANART_TV_API_KEY})
    except:
      Log('Couldn\'t fetch Fanart.tv artist.')

  return fanart_artist

def find_artist_posters(posters, artist, lastfm_artist, fanart_artist):

    if artist == 'Various Artists':
      return

    if lastfm_artist:
    
      # Fanart.tv.
      if fanart_artist and 'artistthumb' in fanart_artist:
        posters.extend([thumb['url'] for thumb in fanart_artist['artistthumb']])

      # Last.fm.
      posters.extend([image['#text'] for image in lastfm_artist['image'] if len(image['#text']) > 0 and image['size'] == 'mega'])
      posters.extend([image['#text'] for image in lastfm_artist['image'] if len(image['#text']) > 0 and image['size'] == 'extralarge'])
    
    # Discogs cache.
    try:
      images = XML.ElementFromURL('http://meta.plex.tv/a/' + quote(normalize_artist_name(artist))).xpath('//image')
      posters.extend([image.get('url') for image in images if image.get('primary') == '1'])
      posters.extend([image.get('url') for image in images if image.get('primary') == '0'])
    except:
      Log('No artist result from Discogs cache')      

def find_artist_art(arts, artist, lastfm_artist, fanart_artist, artist_mbid):

    # Fanart.tv.
    if fanart_artist and 'artistbackground' in fanart_artist:
      for art in fanart_artist['artistbackground']:
        arts.append((art['url'], FANART_TV_PREVIEW_URL % art['url']))

    # HT Backdrops. Try MBID-based lookup first.
    htbackdrops_arts = []
    if artist_mbid is not None:
      try:
        for image_id in XML.ElementFromURL(HTBACKDROPS_MBID_SEARCH_URL % lastfm_artist['mbid']).xpath('//image/id/text()'):
          htbackdrop_arts.append((HTBACKDROPS_FULL_URL % image_id, HTBACKDROPS_THUMB_URL % image_id))
      except Exception, e:
        Log('Error fetching artist art from HTBackdrops by MBID: ' + str(e))

    # If we had no MBID, or we didn't find any artwork based on one, try with the regular HT Backdrops search.
    if len(htbackdrops_arts) == 0:
      artist_results = find_htbackdrops_artist(artist)
      if artist_results and len(artist_results) > 0 and artist_results[0]['score'] >= 98:
        try:
          for image_id in XML.ElementFromURL(HTBACKDROPS_KEYWORD_SEARCH_URL % String.Quote(String.DecodeHTMLEntities(artist_results[0]['id']), usePlus=True)).xpath('//image/id/text()'):
            htbackdrops_arts.append((HTBACKDROPS_FULL_URL % image_id, HTBACKDROPS_THUMB_URL % image_id))
        except Exception, e:
          Log('Error fetching artist art from HTBackdrops by artist name: ' + str(e))

    # Finally append any arts we found.
    arts.extend(htbackdrops_arts)
