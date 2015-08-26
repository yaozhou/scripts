#!/bin/sh
PWD="$(cd $(dirname $0) && pwd)"

. $PWD/../rules.sh

if [ "$1" != "" ] ; then
    SERVER=$1
fi

scp $PWD/lsof matrix@$SERVER:/system/sbin
