#!/bin/bash

cmd="cat" 
for file in ./*.gitignore
do
    if test -f $file
    then
        cmd=$cmd"  "$file
    fi 
done

output="mygitignore"
if [ -e $output ]
then
    echo "delete old $output"
    rm $output
fi

touch $output

echo $cmd
$cmd > $output 


