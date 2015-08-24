#!/bin/sh

MUSIC_PATH="/home/eric-zhou/Dropbox/Public/relax-music/mp3"

ecasound -a:1 -i:"$MUSIC_PATH/钢琴曲.mp3"
         -a:2 -i:"$MUSIC_PATH/强风.mp3"
  -a:1,2 -o:loop,1
         -a:3 -ea:200 -i:loop,1 -o alsa
--cut--