#!/bin/bash

if [ "$1" == "window" ]; then
	rofi -show window -m -1 -padding 20 -width 30 -lines 5 -color-window "#111314, #7e57c2, #7e57c2" -color-normal "#111314, #7e57c2, #111314, #7e57c2, #111314" -color-active "#111314, #7e57c2, #111314, #7e57c2, #111314" -location 0 -font "Print Char 21 12" -bc "#7e57c2" -bw 2 -opacity 100
else
	rofi -show run -m -1 -padding 20 -width 30 -lines 5 -color-window "#111314, #7e57c2, #7e57c2" -color-normal "#111314, #7e57c2, #111314, #7e57c2, #111314" -color-active "#111314, #7e57c2, #111314, #7e57c2, #111314" -location 0 -font "Print Char 21 12" -bc "#7e57c2" -bw 2 -opacity 100 -regex

fi
