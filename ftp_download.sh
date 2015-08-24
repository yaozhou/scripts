#!/bin/sh

if [ $# != 1 ] ; then
    echo $0 dir
    exit 1
fi

HOST='115.29.171.150'
USER='eric-zhou'
PASSWD='123456'
FILE='file.txt'

ftp -n $HOST <<EOF

quote USER $USER
quote PASS $PASSWD
prompt
binary
cd $1
lcd $1
mget *
quit
exit 0
EOF
