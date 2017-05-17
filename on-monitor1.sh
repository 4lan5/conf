#!/bin/bash

#turn on monitor1 and reset wallpaper in i3wm


xrandr --output  LVDS1  --auto  --output  HDMI1 --auto --right-of LVDS1 

feh --bg-scale ~/Pictures/WALLPAPER/SZE.jpg
