#!/usr/bin/env python
# svn merge-tool python wrapper for meld
import sys
import subprocess

try:
   # path to meld
   meld = "meld"

   # file paths
   base   = sys.argv[1]
   theirs = sys.argv[2]
   mine   = sys.argv[3]
   merged = sys.argv[4]

   # the call to meld
   # For older meld versions:
   # cmd = [meld, mine, base, theirs, merged]
   # New meld versions: >= 1.8.4
   cmd = [meld, mine, base, theirs, '-o', merged]

   # Call meld, making sure it exits correctly
   subprocess.check_call(cmd)
except:
   print "svn meld merge, an error!"
   sys.exit(-1)  
