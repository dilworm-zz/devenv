#!/bin/bash
source util.sh # get_conf_value , assert

conf="./conf" # 所有参数从这里读取,参数格式为 key = value

#get_conf_value $conf env
#assert $env, "env must NOT nil or empty"

scripts_dir=$(pwd)
working_dir=$(readlink -f $scripts_dir/../fish3d)
log_dir=$working_dir/log
assert $log_dir "Can't find log dir $log_dir"



# 1, find and remove all files that last modified time is greater than MAX_TIME seconds
cd $log_dir
files=($(ls|xargs))

MAX_TIME=`expr 3600 \* 24 \* 6`

now=$(date +%s)
lastmodifiedtime=
for f in ${files[@]}; do
    lastmodifiedtime=$(stat -c %Y $f)
    diff=`expr $now - $lastmodifiedtime`
    if [ $diff -ge $MAX_TIME ];then
        echo $f
    fi
done






