#!/bin/sh
PWD="$(cd $(dirname $0) && pwd)"

. $PWD/../rules.sh

if [ "$1" != "" ] ; then
    SERVER=$1
fi

scp $PWD/*.lua matrix@$SERVER:/system/share/lua/5.1
