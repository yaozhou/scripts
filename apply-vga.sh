#/bin/sh

#cvt 1440 900 75
xrandr --newmode "1440x900_75.00"  136.75  1440 1536 1688 1936  900 903 909 942 -hsync +vsync
xrandr --addmode VGA2 "1440x900_75.00"

xrandr --output VGA2 --mode 1440x900_75.00

