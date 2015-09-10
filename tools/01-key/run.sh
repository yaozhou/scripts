#!/bin/sh
PWD="$(cd $(dirname $0) && pwd)"
. $PWD/../rules.sh

if [ "$1" != "" ] ; then
    SERVER=$1
fi

AUTH_KEYS="/etc/dropbear/authorized_keys"
TMP_KEY="/tmp/key"

scp /home/yao/.ssh/id_rsa.pub matrix@$SERVER:$TMP_KEY
ssh matrix@$SERVER "cat $TMP_KEY >> $AUTH_KEYS ; chmod 0600 $AUTH_KEYS; rm $TMP_KEY"
