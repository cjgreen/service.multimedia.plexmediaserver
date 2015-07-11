import os, os.path, time
import Filter, Media, PhotoFiles

# Scans through files, and add to the media list.
def Scan(path, files, mediaList, subdirs, language=None, root=None, **kwargs):
  
  # Filter out bad stuff.
  PhotoFiles.Scan(path, files, mediaList, subdirs, root)
  
  # Add all the photos to the list.
  for path in files:
    file = os.path.basename(path)
    title,ext = os.path.splitext(file)
    photo = Media.Photo(title)
    
    # Creation date, year.
    created_at = time.localtime(os.path.getmtime(path))
    photo.released_at = time.strftime('%Y-%m-%d', created_at)
    photo.year = int(time.strftime('%Y', created_at))
    
    photo.parts.append(path)
    mediaList.append(photo)