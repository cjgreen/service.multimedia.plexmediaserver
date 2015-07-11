import re, unicodedata

ANTI_PATTERNS = [re.compile(r'^q&a.*', re.IGNORECASE),
                 re.compile(r'^inside.the.album.*', re.IGNORECASE),
                 re.compile(r'^lift.video.diary.*', re.IGNORECASE),
                 re.compile(r'^vvv.*', re.IGNORECASE),
                 re.compile(r'^hoppus.on.music.*', re.IGNORECASE),
                 re.compile(r'^hot.this.week.*', re.IGNORECASE),
                 re.compile(r'^in.the.studio*', re.IGNORECASE),
                 re.compile(r'.*\(aol.sessions\)$', re.IGNORECASE),
                 re.compile(r'.*\(podcast\)$', re.IGNORECASE),
                 re.compile(r'.*\(yahoo!.new.now\)$', re.IGNORECASE),
                 re.compile(r'.*\(documentary.outtake\)$', re.IGNORECASE),
                 re.compile(r'.*video.diary$', re.IGNORECASE),
                 re.compile(r'.*wild.tour.stories\)?$', re.IGNORECASE),
                 re.compile(r'.*album.commentary$', re.IGNORECASE),
                 re.compile(r'.*spotlight country\)?$', re.IGNORECASE),
                 re.compile(r'.*music.video.preview\)?$', re.IGNORECASE),
                 re.compile(r'.*in.store.footage$', re.IGNORECASE),
                 re.compile(r'.*\(track.by.track\)$', re.IGNORECASE),
                 re.compile(r'.* \(?part [IVX\d]+\)?$', re.IGNORECASE),  # Foo Video (part 2)
                 re.compile(r'.*behind.the.(?:scenes|album).*', re.IGNORECASE),  # Foo Video (Behind the Scenes)
                 re.compile(r'.*teaser.*', re.IGNORECASE),  # Foo Video (Teaser #2)
                 re.compile(r'.*making.(?:of|the)', re.IGNORECASE),  # Foo Video (The Making Of)
                 re.compile(r'.*web.[\d]$', re.IGNORECASE),  # Web.1
                 re.compile(r'.*trailer.*', re.IGNORECASE),  # Foo Album (trailer)
                 re.compile(r'.*preview\)?$', re.IGNORECASE),  # Foo Video (sneak preview)
                 re.compile(r'.*webisode.*', re.IGNORECASE),  # Beyonce Goes Shopping or Something (webisode)
                 re.compile(r'.*\(1 mic 1 take\)$', re.IGNORECASE)]

def artist_search(results, media, lang, artist_name):

  # Precompose.
  try:
    artist_name = unicodedata.normalize('NFKD', artist_name.decode('utf-8'))
  except UnicodeError:
    artist_name = unicodedata.normalize('NFKD', artist_name)

  # Strip diacritics.
  stripped = u''
  for i in range(len(artist_name)):
    point = artist_name[i]
    if not unicodedata.combining(point):
      stripped += point
  artist_name = stripped


  json_obj = JSON.ObjectFromURL('http://127.0.0.1:32400/services/vevo/search?q=%s&artistsLimit=6&videosLimit=1' % (String.Quote(artist_name)))

  score = 100
  normalized_artist_name = Core.messaging.call_external_function('com.plexapp.agents.plexmusic', 'MessageKit:NormalizeArtist', kwargs = dict(artist=artist_name))
  for artist in json_obj['artists']:

    # Require a perfect match after normalization to avoid false positives.
    normalized_artist_result = Core.messaging.call_external_function('com.plexapp.agents.plexmusic', 'MessageKit:NormalizeArtist', kwargs = dict(artist=artist['name']))
    Log('Sanity checking normalized artist: %s against Vevo result: %s' % (normalized_artist_name, normalized_artist_result))
    if normalized_artist_name == normalized_artist_result:        
      results.add(SearchResult(
        id = artist['urlSafeName'],
        score = score
      ))
      score = score - 1


def is_live_video(video):
    if 'LivePerformance' in video['categories']:
      return True
      
    if video['title'].lower().find('amex unstaged') != -1:
      return True
      
    if re.match(r'.*(?:\(|: )live.(?:on|from|in|at|[\d]{4}).*', video['title'], re.IGNORECASE):
      return True

    if video['title'].lower().find('on tour') != -1:
      return True

    return False

def anti_pattern_regex_check(title):
  for pattern in ANTI_PATTERNS:
    if pattern.match(title):
      return True
  return False

def get_videos(artist, videos):

    json_obj = JSON.ObjectFromURL('http://127.0.0.1:32400/services/vevo/videos/artist/%s?size=150' % (artist))
    
    real_videos = 0
    for video in json_obj['videos']:

      title = video['title']

      # Check explicit pref.
      if video['isExplicit'] and not Prefs['include_explicit']:
        Log('Skipping explicit video: %s' % video['title'])
        continue
      
      # Make sure this is one of the categories we want.
      wanted_categories = ['Live Performance', 'Lyrics', 'Music Video']
      if not filter(lambda t: t in wanted_categories, video['categories']):
        continue

      # Skip "original content."
      if video['isOriginalContent']:
        continue

      # Now we have two problems.
      if anti_pattern_regex_check(video['title']):
        continue

      # Lyric videos.
      if 'Lyrics' in video['categories']:
        extra_class = LyricMusicVideoObject
        sort_order = 1
      
      # Live videos.
      elif is_live_video(video):
        extra_class = LiveMusicVideoObject
        sort_order = 3

      # Regular music videos.
      else:
        extra_class = MusicVideoObject
        sort_order = 0
        real_videos += 1
  
      video['sort_order'] = sort_order
      video['class'] = extra_class

      videos.append(video)

    # Sort by view count and category.
    videos.sort(key=lambda s: s['views']['total'], reverse=True)
    videos.sort(key=lambda s: s['sort_order'])

    # Make sure we don't return more live performances than actual videos.
    videos = videos[0:real_videos * 2]

def get_thumb_url(video):

  # Safely get thumbnail URL (sometimes it's missing), fall back to artist thumb.
  thumb = None
  thumb_url = video.get('thumbnailUrl', '')
  if len(thumb_url) > 0:
    thumb = 'internal://services/vevo/thumb?url=' + String.Quote(thumb_url)
  if thumb is None:
    thumb_url = video.get('artists', [{'thumbnailUrl':''}])[0].get('thumbnailUrl', '')
    if len(thumb_url) > 0:
      thumb = 'internal://services/vevo/thumb?crop=top&url=' + String.Quote(thumb_url)

  return thumb


def Start():

  HTTP.CacheTime = 3600*24

####################################################################################################
class VevoArtistAgent(Agent.Artist):

  name = 'VEVO Music Videos'
  languages = [Locale.Language.NoLanguage]
  primary_provider = False
  contributes_to = ['com.plexapp.agents.plexmusic', 'com.plexapp.agents.lastfm', 'com.plexapp.agents.localmedia']

  def search(self, results, media, lang, manual=False, tree=None):
    if tree.title:
      Log('Searching for Vevo artist: %s' % tree.title)
      artist_search(results, media, lang, tree.title)

  def update(self, metadata, media, lang):
  
    if Prefs['include_artist']:
      videos = []
      get_videos(metadata.id, videos)

      # Todo: Check for existing music videos and remove ones that are no longer available
      for video in videos:
        music_video = video['class'](
          url = 'vevo://%s' % video['isrc'] + '/' + video['artists'][0]['urlSafeName'],
          title = video.get('title'),
          year = video.get('year'),
          originally_available_at = Datetime.ParseDate(video.get('releaseDate')).date(),
          thumb = get_thumb_url(video),
          rating_count = video.get('views')['total']
        )

        metadata.extras.add(music_video)


class VevoAlbumAgent(Agent.Album):

  name = 'VEVO Music Videos'
  languages = [Locale.Language.NoLanguage]
  primary_provider = False
  contributes_to = ['com.plexapp.agents.plexmusic', 'com.plexapp.agents.localmedia']

  def search(self, results, media, lang, manual=False, tree=None):
    if tree.title:
      Log('Searching for Vevo artist: %s' % tree.title)
      artist_search(results, media, lang, tree.title)

  def update(self, metadata, media, lang):

    Log('media.id: ' + media.id)

    videos = []
    get_videos(metadata.id, videos)

    for index, track in enumerate(media.children):
      for video in videos:
        
        # Only music videos and lyrical videos for tracks.
        if video['class'] != MusicVideoObject and video['class'] != LyricMusicVideoObject:
          continue
        
        score = 100 - (10 * abs(String.LevenshteinDistance(track.title.lower(), video['title'].lower())))
        
        # Try simplified match.
        if score <= 85:
          clean_title = re.sub(r'\(.*\)$', '', video['title'])
          score = 100 - (10 * abs(String.LevenshteinDistance(track.title.lower(), clean_title.lower())))
        
        if score > 85:
          music_video = video['class'](
            url = 'vevo://%s' % video['isrc'] + '/' + video['artists'][0]['urlSafeName'],
            title = video['title'],
            year = video['year'],
            originally_available_at = Datetime.ParseDate(video['releaseDate']).date(),
            thumb = get_thumb_url(video),
            rating_count = video['views']['total']
          )

          # Add the video, and we're done (only one video per track allowed)
          Log('Adding music video %s to track %s - %s' % (music_video.title, index, track.title))
          metadata.tracks[track.guid].extras.add(music_video)
          break
