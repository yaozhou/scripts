#!/bin/sh

PICTURE_PATH="/home/eric-zhou/Pictures"

for folder in $PICTURE_PATH/*
do
    if [ -d "$folder" ] ; then        
        tar_name=`basename "$folder"`
        echo "开始备份$tar_name"
        tar -czf "$tar_name.tar.gz" "$folder"
        mv "$tar_name.tar.gz" "$PICTURE_PATH"
    fi
done