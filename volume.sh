#!/usr/bin/env bash
echo -e "Vol: %{A:pavucontrol:}%{F#95b47b}\uf027%{F-} $(awk -F[][] '{ print $2 }' <(amixer sget Master) | tail -n 1)%{A}"
