#!/bin/bash

# 从配置中读取参数的值,配置必须为key=value 格式, '#' 后的认为是注释
function get_conf_value() {
    local conf=$1
    local keyname=$2

    local ret=$2
    if [ ! -n $key ]; then
        echo "missing parament 'key'"
        return
    fi
    local valpattern=" *[_.a-zA-Z0-9@#]+"
    #local value=$(grep -w $keyname $conf |awk -F "=" '/ *'"$keyname"' *= *[_.a-zA-Z0-9#]+/{print $2}' |awk -F "#" '{print $1}')
    local value=$(grep -w $keyname $conf |awk -F "=" '/ *'"$keyname"' *='"$valpattern"'/{print $2}' |awk -F "#" '{print $1}')
    value=$(echo $value) # echo 一次去掉左边和右边的空格
    eval $ret="'$value'"
}

# Usage:
#conf="./conf" # 所有参数从这里读取,参数格式为 key = value
#get_conf_value $conf db_host
#get_conf_value $conf dev_svr
#echo $db_host $dev_svr


# assert fail, then exit
function assert(){
    local exp=$1
    local errmsg=$2
    
    if [ "$exp" == "" ]; then
        echo "Error: $errmsg"
        exit 1
    fi

    if [ $exp == false ]; then
        echo "Error: $errmsg"
        exit 1
    fi

    if [ "$exp" == "0" ]; then
        echo "Error: $errmsg"
        exit 1
    fi

    if [ ! -e $exp ]; then
        echo "Error: $errmsg"
        exit 1
    fi
}
