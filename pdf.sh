#!/bin/sh

[ -d ./out ] || mkdir out 

for file_name in ./*.html; do

	basename=${file_name%.*}
	suffix=${file_name#*.}

	
	wkhtmltopdf $file_name $basename.pdf
	mv $basename.pdf out/
done
