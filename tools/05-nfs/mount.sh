#!/bin/sh

PWD="$(cd $(dirname $0) && pwd)"
. $PWD/../rules.sh

if [ "$1" != "" ] ; then
    SERVER=$1
fi

SERVER_OP_PATH="/home/eric-zhou/work/mtk-openwrt"
CLIENT_OP_PATH="/mtk-openwrt"

SERVER_APP_PATH="/home/eric-zhou/work/modou-app"
CLIENT_APP_PATH="/modou-app"

SERVER_WEB_PATH="/home/eric-zhou/work/mogubao-web"
CLIENT_WEB_PATH="/mogu-web"

#ip=`ifconfig | grep "inet addr:192.168." | awk '{print $2}' | awk -F ':' '{print $2}'`

ip=`ifconfig | grep "inet addr:" | grep -v "127.0.0.1" | awk '{print $2}' | awk -F : '{print $2}'`
echo "local ip is $ip" 

mount() 
{
    local server_path=$1
    local client_path=$2


    echo "now is mounting $1 to remote:$2"
    ssh matrix@$SERVER "mkdir $client_path ; mount -t nfs -o nolock $ip:$server_path $client_path"    
}

mount "$SERVER_OP_PATH" "$CLIENT_OP_PATH"
mount "$SERVER_APP_PATH" "$CLIENT_APP_PATH"
mount "$SERVER_WEB_PATH" "$CLIENT_WEB_PATH"





