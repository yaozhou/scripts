#!/bin/sh

. ./rules.sh

start() {
    ssh matrix@$SERVER "mv /system/nginx/html/matrix /system/nginx/html/matrix_bak ; ln -s /mogu-web/dist/web /system/nginx/html/matrix"
}

stop() {
    ssh matrix@$SERVER "rm /system/nginx/html/matrix ; mv /system/nginx/html/matrix_bak /system/nginx/html/matrix"
}

case "$1" in
    "start")
        start ;;
    "stop")
        stop ;;
    *)
        ;;
esac
    