#!/bin/bash
#
BASE=${1}
THEIRS=${2}
MINE=${3}
MERGED=${4}
WCPATH=${5}

vimdiff $MINE $THEIRS -c ":bo sp $MERGED" -c ":diffthis" -c "setl stl=MERGED | wincmd W | setl stl=THEIRS | wincmd W | setl stl=MINE"


# 1, put this into /usr/bin/local 
# 2, open file "~/.subversion/config", and set
#       "merge-tool-cmd = /user/bin/local/svnmerge.sh", the path should be absolute path
