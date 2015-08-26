#!/bin/sh

PWD="$(cd $(dirname $0) && pwd)"
. $PWD/../rules.sh


if [ "$1" != "" ] ; then
    SERVER=$1
fi


scp $PWD/*.ko matrix@$SERVER:/data
scp $PWD/*.ipk matrix@$SERVER:/data
ssh matrix@$SERVER "ln -s /data/*.ko /lib/modules/2.6.36/ ; modprobe nfs.ko ; opkg install /data/*.ipk ; rm /data/*.ko ; rm /data/*.ipk" 
