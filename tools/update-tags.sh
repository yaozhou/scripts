#!/bin/sh

find . -name "*.c" -exec etags -a '{}' \;
find . -name "*.h" -exec etags -a '{}' \;
find . -name "*.cpp" -exec etags -a '{}' \;
find . -name "*.cxx" -exec etags -a '{}' \;