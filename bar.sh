#!/bin/bash

font="GohuFont:style=Regular:size=10"
fallback_font="FontAwesome:size=8"
background="#F2212121"
foreground="#aeb1b7"
accent="#7e57c2"
a=30

monitors=$(xrandr | grep -o "^.* connected" | sed "s/ connected//")
display1res=$(xrandr | fgrep '*' | awk '{print $1;}' | tr 'x' $' ' | awk '{print $1;}')
width=$(echo "$display1res - 44" | bc)
barsize=$(echo "$width x20+20+10" | tr -d " ")

if [[ $1 == "-f" ]]; then
    # full width, no padding
    x=1920
    y=40
    x_offset=0
    y_offset=0
elif [[ $1 == "-h" ]]; then
    # half width
    x=900
    y=40
    x_offset=500
    y_offset=15
else
    x=1880
    y=40
    x_offset=20
    y_offset=15
fi

#for m in $monitors; do
    #admiral | lemonbar -a $a -g "${x}x${y}+${x_offset}+${y_offset}" -f $font -f $fallback_font -B $background -F $foreground | sh &
    ~/.scripts/barinput.sh | lemonbar -d -a $a -f $font -f $fallback_font -B $background -F $foreground -r 2 -R $accent -g $barsize | sh &
    #admiral | lemonbar -d -a $a -f $font -f $fallback_font -B $background -F $foreground -g $barsize | sh &
    # the following line gets the width of the current monitor
    #monitor_width=$(xrandr | grep '*' | ruby -e "puts gets.strip.split[0].split('x')" | head -n 1)
    #let x_offset+=$monitor_width
    #echo "Started bar on $m"
#done
