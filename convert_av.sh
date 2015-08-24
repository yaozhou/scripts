#!/bin/sh

ffmpeg -i IMG_4326.MOV -crf 18 -threads 4 -vf transpose=1 -acodec copy OUTPUT.MOV
#0为逆时针90°且垂直翻转，1为顺时针旋转90°，2为逆时针旋转90°，3为顺时针90°且垂直翻转。
