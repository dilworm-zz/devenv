#!/bin/bash
DIFF="vimdiff"
LEFT=${6}
RIGHT=${7}
$DIFF $LEFT $RIGHT 



#Usage: 
#   1, put this file in /usr/local/bin
#   2, modify ./subversion/config, write a line 
#        "diff-cm=/usr/local/bin/svndiff.sh" 
#   3, now, you can vimdiff as svn diff tool
