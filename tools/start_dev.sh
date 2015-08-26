#!/bin/sh
PWD="$(cd $(dirname $0) && pwd)"

for dir in $PWD/*
do
    if [ -d $dir ] ; then
	if [ -f $dir/run.sh ] ; then
	    $dir/run.sh
	fi
    fi
done

