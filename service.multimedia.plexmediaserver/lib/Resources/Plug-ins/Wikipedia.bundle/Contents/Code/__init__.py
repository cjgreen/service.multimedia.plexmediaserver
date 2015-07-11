#wikipedia movie summary agent
import re

GOOGLE_JSON_URL = 'http://ajax.googleapis.com/ajax/services/search/web?v=1.0&rsz=large&q=%s'   #[might want to look into language/country stuff at some point] param info here: http://code.google.com/apis/ajaxsearch/documentation/reference.html
WIKIPEDIA_JSON_URL = 'http://%s.wikipedia.org/w/api.php?action=query&prop=revisions&titles=%s&rvprop=content&format=json'
#BING_JSON_URL   = 'http://api.bing.net/json.aspx?AppId=879000C53DA17EA8DB4CD1B103C00243FD0EFEE8&Version=2.2&Query=%s&Sources=web&Web.Count=8&JsonType=raw'

def Start():
  HTTP.CacheTime = CACHE_1WEEK
  
class WikipediaAgent(Agent.Movies):
  name = 'Wikipedia'
  languages = [Locale.Language.English]
  primary_provider = False
  contributes_to = ['com.plexapp.agents.imdb']
  
  def search(self, results, media, lang):
    
    normalizedName = String.StripDiacritics(media.primary_metadata.title)
    jsonObj = JSON.ObjectFromURL(GOOGLE_JSON_URL % String.Quote('"' + normalizedName + '" film site:wikipedia.org', usePlus=True))
    if jsonObj['responseData'] != None:
      jsonObj = jsonObj['responseData']['results']
      if len(jsonObj) > 0:
        url = jsonObj[0]['unescapedUrl']
        if url.count('wikipedia.org') > 0:
          url = url.split('/')[-1].replace('&','%26')
          
          imdb_year = media.primary_metadata.year

          jsonOBJ = JSON.ObjectFromURL(WIKIPEDIA_JSON_URL % ('en', url))['query']['pages']
          rev = jsonOBJ[jsonOBJ.keys()[0]]['revisions']

          # Check for a redirect link
          if rev[0]['*'].count('#REDIRECT [[') > 0:
            url = rev[0]['*'][rev[0]['*'].find('[[') + 2:rev[0]['*'].find(']]')]
            
          # Check for disambiguation
          elif rev[0]['*'].count("In '''movies''':") > 0 or rev[0]['*'].count('{{disambig}}') > 0:
            page = rev[0]['*'].split("In '''movies''':\n")[-1]
            matches = re.findall('\[\[(.*film.*)\|', page)
            
            closestYear = 999
            bestMatch = ''

            for match in matches:
              m = re.search("([12][0-9]{3}) film", match)
              if m:
                ambig_year = int((m.group(1)))
                if abs(ambig_year - imdb_year) < closestYear:
                  closestYear = abs(ambig_year - imdb_year)
                  url = match.replace(' ','_')

          # Grab page and confirm we have the imdb link there, else reduce the score below the threshold
          jsonOBJ = JSON.ObjectFromURL(WIKIPEDIA_JSON_URL % ('en', url))['query']['pages']
          rev = jsonOBJ[jsonOBJ.keys()[0]]['revisions'][0]['*']
          score = 100
          if rev.count(media.primary_metadata.id.replace('tt','')) == 0:
            score = score - 25
            Log('No link to movie, penalizing.')
            
            if rev.count('Infobox actor') > 0:
              Log('Looks like an actor page, penalizing appropriately.')
              score = score - 10

          results.Append(MetadataSearchResult(
            id    = url,
            score = score))
        
  def update(self, metadata, media, lang):
    (rev, page) = self.getPage(metadata.id, 'en')
    
    # Get the specific language page if not english.
    if lang != 'en':
      languages = re.findall('\[\[(([a-z]{2}):.*?)\]\]', page)
      lang_map = {}
      for (link, language) in languages:
        lang_map[language] = link
      
      if lang_map.has_key(lang):
        (rev, page) = self.getPage(lang_map[lang][3:].replace(' ','_'), lang)
    
    try:
      
      # See if we need to take out any initial commentary.
      m = re.search("''[^'].*?''([ ]<BR>)?", page)
      if m.start(0) == 0:
        page = page[m.end(0):]
      
      # More comments.
      rx = re.compile("\n*<!--.*?-->\n*", re.DOTALL | re.MULTILINE)
      page = rx.sub("", page)
      
      # Do we have an "official" start? Cheating, but helps us skip lots of stuff.
      if page.find("'''''") != -1:
        page = page[page.find("'''''"):]
      
      level = 0
      done = False
      index = 0
      
      while not done:
        open = page.find('{{', index)
        close = page.find('}}', index)
        
        # Doesn't start with an open.
        if index == 0 and open > 5:
          break
        
        # Manage levels.
        if open != -1 and open < close:
          level = level + 1
          index = open + 2
        elif close != -1 and level > 0:
          level = level - 1
          index = close + 2

        # See if we're done.
        if level == 0 and page[index:index+4].strip()[0:2] != '{{':
          break
          
        # Safety in case something goes wrong.
        if level > 20:
          break
          
      end = page.find('==', index)
      if end != -1:
        summary = page[index+1:end].strip().strip(":")

      # Remove external links.
      rxExt = re.compile('\{\{.*?\}\}', re.DOTALL)
      summary = rxExt.sub('', summary)
      summary = re.sub('<ref>.*?</ref>', '', summary)

      # Remove brackets from simple internal links like [[Link]]
      summary = re.sub('\[\[([^|]*?)\]\]', r'\g<1>', summary)
      # Keep names from named internal links like [[Link|name]]
      summary = re.sub('\[\[.*?\|(.*?)\]\]', r'\g<1>', summary)

      # Remove everything else
      replaceStrs = "'''''","''''","'''","''","[[","]]","()"
      for r in replaceStrs:
        summary = summary.replace(r,'')
      # squeeze multiple spaces
      summary = re.sub(' {2,}', ' ', summary)
    
      # FIXME, need to resolve these: -{zh-hans:港译《侠盗·骄雄》; zh-hant:香港譯《俠盜·驕雄》; zh-hk:中國大陸及台灣均譯《羅賓漢》;}-
    
      summary = String.StripTags(HTML.StringFromElement(HTML.ElementFromString(summary)))
      metadata.summary = summary
      
    except:
      Log('Error parsing summary for ' + metadata.id)
    
    # Get other data.
    page = rev[0]['*']
    
    # Directors.
    directors = self.getValues(page, 'director')
    if len(directors) > 0:
      metadata.directors.clear()
      metadata.directors.add(directors[0])
    
    # Cast.
    starring = self.getValues(page, 'starring')
    if len(starring) > 0:
      metadata.roles.clear()
      for member in starring:
        role = metadata.roles.new()
        role.actor = member
    
    # Distributor.
    distributor = self.getValues(page, 'distributor')
    if len(distributor) > 0:
      metadata.studio = distributor[0]
    
    # Poster.
    image = self.getValues(page, 'image')
    if len(image) > 0:
      path = 'http://en.wikipedia.org/wiki/File:' + image[0]
      #data = HTTP.Request(path)
      #if image[0] not in metadata.posters:
      #  metadata.posters[image[0]] = Proxy.Media(data)
      
    writers = self.getValues(page, 'writer')
    runtime = self.getValues(page, 'runtime')

    # Release date.
    released = self.getValues(page, 'released')
    if len(released) > 0:
      availableAt = None
      date = released[0]
      
      # Clean up.
      if len(released) > 4 and released[0].find('date') != -1:
        date = '-'.join(released[1:4])
        
      date = re.sub('\(.*\)', '', date)
      
      try:
        availableAt = Datetime.ParseDate(date)
      except:
        m = re.search(r'([0-9]{4})\|([0-9]{1,2})\|([0-9]{1,2})', date)
        if m:
          s = '%s-%s-%s' % (m.groups(1)[0], m.groups(1)[1], m.groups(1)[2])
          availableAt = Datetime.ParseDate(s)
        else:
          Log("No match for date: " + date)
        
      parent_metadata = metadata.contribution('com.plexapp.agents.imdb')
      if availableAt and parent_metadata is not None and abs(availableAt.year - parent_metadata.year) <= 1:
        metadata.originally_available_at = availableAt.date()
        metadata.year = availableAt.year
      
  def getPage(self, id, lang):
    jsonOBJ = JSON.ObjectFromURL(WIKIPEDIA_JSON_URL % (lang, id))['query']['pages']
    rev = jsonOBJ[jsonOBJ.keys()[0]]['revisions']
    return (rev, rev[0]['*'].replace("}}\n\n'''''", "}}\n'''''"))
      
  def getValues(self, page, name):
    value = None
    regexps = ['[ ]+=[\t ]+(.*?)\n\|', '[ ]+=[\t ]+(.*?)\|\n']
    for r in regexps:
      rx = re.compile(name + r, re.IGNORECASE|re.DOTALL|re.MULTILINE)
      m1 = rx.search(page)
      if m1:
        value = m1.groups()[0]

        if value.find('{{small|') != -1:
          value = re.sub('\{\{small\|.+?\}\}', '', value)

        if value.find('{{Plain list') == 0 or value.find('{{Plainlist') == 0:
          value = value.split('\n')[1:-1]

          break

        if value[0:5].lower() == '{{ubl' or value.find('{{Unbulleted list') == 0:
          value = value.split('|')[1:]
        elif value.find('<br />') != -1:
          value = value.split('<br />')
        elif value.find('<br>') != -1:
          value = value.split('<br>')
        elif value.find('<br \\/>') != -1:
          value = value.split('<br \\/>')
        else:
          value = [value]

        break
    
    ret = []    
    if value is not None:
      nuke = ['[[',']]','}}','{{', ':* ', '* ']
    
      for v in value:
        for n in nuke:
          v = v.replace(n, '')

        if v.find('|') != -1 and v.find('date|') == -1:
          v = v.split('|')[1]
        v = re.sub('<[^>]+>', '', v)
        v = v.strip()
        v = v.strip(',')
      
        if v.find("'''") == -1:
          ret.append(v)
    
    return ret
    
