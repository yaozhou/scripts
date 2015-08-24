#!/bin/sh

pptpsetup --create myvpn --server v7.blockcn.net --username ayao-5bird --password ayaoayao --encrypt --start

if [ $? != 0 ] ; then
    echo "connect failed"
    exit 1;
fi

ip route del default 

ip route add default dev ppp0

#sudo ip route add default via 192.168.18.1


#echo "lcp-echo-interval 30" >> $PPPOE_FILE
#pppd file /etc/options.pptp updetach debug
