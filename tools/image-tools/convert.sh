#!/bin/sh

if [ $# != 2 ] ; then
    echo "usage : $0 input-path output-path" ; 
    exit 1 ;
fi

IN="$1"
OUT="$2"


for file in $IN/*
do
    if [ -f "$file" ] ; then
        name=`basename "$file"`
        convert "$file" -resize 320x240 "$OUT/$name.png"
    fi
done