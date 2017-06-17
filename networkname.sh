#!/usr/bin/env bash
nname=$(nmcli connection show --active | grep wireless | awk '{print $1;}')
echo -en "%{A:connman-gtk:}%{F#7d8fa3}\uf1eb%{F-} "
if [[ $nname != "" ]]; then
  echo -n "$nname"
else
  echo -n "Not connected"
fi
echo "%{A}"

