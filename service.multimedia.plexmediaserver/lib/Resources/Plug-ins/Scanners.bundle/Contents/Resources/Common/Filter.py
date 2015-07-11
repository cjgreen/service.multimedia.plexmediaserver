import os, re, fnmatch, glob
import Utils

IGNORE_DIRS = ['@eaDir', '.*_UNPACK_.*', '.*_FAILED_.*', '\..*', 'lost\+found', '.AppleDouble']
ROOT_IGNORE_DIRS = ['\$Recycle.Bin', 'System Volume Information', 'Temporary Items', 'Network Trash Folder']

# Parse a .plexignore file, append patterns to the plexignore lists.
def ParsePlexIgnore(file, plexignore_files, plexignore_dirs):
  try:
    f = open(file,'r')
    for pattern in f:
      pattern = pattern.strip()
      if pattern != '' and pattern[0] != '#':
        if '/' not in pattern:
          # Match filenames using regex.
          plexignore_files.append(fnmatch.translate(pattern))
        else:
          # Match directories using glob.  Leading slashes screw things up;
          # these should always be relative to the .plexignore file.
          if pattern.strip()[0] != '/':
            plexignore_dirs.append(os.path.join(os.path.dirname(file),pattern))
    f.close()
  except:
    return


# Remove files and directories that don't make sense to scan.
def Scan(path, files, mediaList, subdirs, exts, root=None):

  files_to_whack = []
  plexignore_files = []
  plexignore_dirs = []
  use_unicode = os.path.supports_unicode_filenames

  # Build a list of things to ignore based on a .plexignore file in this dir.
  if root and Utils.ContainsFile(files, '.plexignore'):
    ParsePlexIgnore(os.path.join(root,path,'.plexignore'), plexignore_files, plexignore_dirs)

  # Also look for a .plexignore in the 'root' for this source.
  if root and files and root != os.path.dirname(files[0]):
    if Utils.ContainsFile(os.listdir(root), '.plexignore'):
      ParsePlexIgnore(os.path.join(root,'.plexignore'), plexignore_files, plexignore_dirs)

  for i in files:
    # Only use unicode if it's supported, which it is on Windows and OS X,
    # but not Linux. This allows things to work with non-ASCII characters
    # without having to go through a bunch of work to ensure the Linux 
    # filesystem is UTF-8 "clean".
    #
    if use_unicode:
      try: filename = unicode(i.decode('utf-8'))
      except: files_to_whack.append(i)
    else:
      filename = i
      
    (file, ext) = os.path.splitext(i)
    file = os.path.basename(file)
    
    # If extension is wrong, don't include.
    if not ext.lower()[1:] in exts:
      files_to_whack.append(i)
    
    # Broken symlinks and zero byte files need not apply.
    if os.path.exists(filename) == False or os.path.getsize(filename) == 0:
      files_to_whack.append(i)

    # Remove unreadable files.
    if not os.access(filename, os.R_OK):
      # If access() claims the file is unreadable, try to read a byte just to be sure.
      try:
        f = open(file,'rb')
        f.read(1)
        f.close()
      except:
        files_to_whack.append(i)
      
    # Remove hidden files.
    if len(file) == 0 or file[0] == '.':
      files_to_whack.append(i)

    # Remove .plexignore file regex matches.
    for rx in plexignore_files:
      if re.match(rx, os.path.basename(i), re.IGNORECASE):
        files_to_whack.append(i)

  # See what directories to ignore.
  ignore_dirs_total = IGNORE_DIRS
  if len(path) == 0:
    ignore_dirs_total += ROOT_IGNORE_DIRS

  dirs_to_whack = []
  for dir in subdirs:
    # See which directories to get rid of.
    baseDir = os.path.basename(dir)
    for rx in ignore_dirs_total:
      if re.match(rx, baseDir, re.IGNORECASE):
        dirs_to_whack.append(dir)
        break

  # Add glob matches from .plexignore before whacking.
  for pattern in plexignore_dirs:
    for match in glob.glob(pattern):
      if os.path.isdir(match):
        dirs_to_whack.append(os.path.dirname(match))
      else:
        files_to_whack.append(match)

  # Whack files.
  files_to_whack = list(set(files_to_whack))
  for i in files_to_whack:
    if i in files:
      files.remove(i)

  # Remove the directories.
  dirs_to_whack = list(set(dirs_to_whack))
  for i in dirs_to_whack:
    if i in subdirs:
      subdirs.remove(i)