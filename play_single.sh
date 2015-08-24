#!/bin/sh

if [ $# != 3  ] ; then
    echo "usage $0 name gap vol";
    exit 1
fi

NAME=$1
GAP=$2
VOL=$3

if [ -z $NAME -o ! -f $NAME ] ; then
    echo "can't find file ($NAME)"
    exit 1
fi

while [ true ]
do
    play -v $VOL $NAME -q
    sleep $GAP 
done


