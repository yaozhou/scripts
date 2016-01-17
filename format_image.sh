#!/bin/sh



for file_name in ./*; do

	echo $file_name
	new_suffix=`file $file_name | awk '{ print $2 }'`
	#new_suffix='jpeg'

	basename=${file_name%.*}
	suffix=${file_name#*.}


	mv $file_name $basename.$new_suffix
done
