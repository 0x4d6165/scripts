#!/bin/bash

if [ "$1" == "window" ]; then
	rofi -show window -m -1 -padding 15 -width 30 -lines 5 -color-window "#212121, #7e57c2, #7e57c2" -color-normal "#212121, #7e57c2, #212121, #7e57c2, #212121" -color-active "#212121, #7e57c2, #212121, #7e57c2, #212121" -location 0 -font "Print Char 21 12" -F2 "#7e57c2" -bw 2
else
	rofi -show run -m -1 -padding 15 -width 30 -lines 5 -color-window "#F2212121, #7e57c2, #7e57c2" -color-normal "#F2212121, #7e57c2, #F2212121, #7e57c2, #F2212121" -color-active "#F2212121, #7e57c2, #F2212121, #7e57c2, #F2212121" -location 0 -font "Print Char 21 12" -F2 "#7e57c2" -bw 2 -regex

fi
