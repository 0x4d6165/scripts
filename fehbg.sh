#!/usr/bin/env bash
WP=$(find $1 -type f | shuf -n 1)
echo $WP
DISPAY=:0.0 feh  --bg-fill -z $WP
DISPAY=:0.1 feh  --bg-fill -z $WP
