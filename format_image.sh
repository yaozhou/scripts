#!/bin/sh



for file_name in ./*; do

	echo $file_name
	new_suffix=`file $file_name | awk '{ print $2 }'`
	#new_suffix='jpeg'

	basename=${file_name%.*}
	suffix=${file_name#*.}

	mv $file_name $basename.$new_suffix

	# change resolution, width -> 700 ,   if we want change height then use x700 instead of 700
	convert -resize 700 $basename.$new_suffix $basename.$new_suffix
done
