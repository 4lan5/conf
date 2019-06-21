#!/bin/bash

#turn on monitor1 and reset wallpaper in i3wm


xrandr --output  LVDS-1  --auto  --output  HDMI-1 --auto --right-of LVDS-1 

feh --bg-scale ~/Pictures/WALLPAPER/SZE.jpg
