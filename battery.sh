#!/usr/bin/env bash

status=$(acpi | awk '{orint $3;}' | sed 's/,//g')
capacity=$(acpi | awk '{print $4;}' | sed 's/%//g' | sed 's/,//g')
color=true
sparks=$(spark 0 $capacity 100)

echo -n "%{F#e5c078}"
if [[ $status == "Charging" ]]; then
    echo -en "\uf0e7"
elif [[ $capacity -ge  "85" ]]; then
    echo -en "\uf240"
elif [[ $capacity -ge "65" ]]; then
    echo -en "\uf241"
elif [[ $capacity -ge "45" ]]; then
    echo -en "\uf242"
elif [[ $capacity -ge "15" ]]; then
    echo -en "\uf243"
elif [[ $capacity -ge "0" ]]; then
    color=true
    echo -en "%{F#cc6666}\uf244"
fi
echo -n "%{F-}"

echo -n "Bat: $capacity% [${sparks:1:1}]"

if [[ color ]]; then
    echo "%{F-}"
else
    echo
fi
