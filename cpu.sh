#!/usr/bin/env bash
percent=$(top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
           awk '{print 100 - $1}')
sparks=$(spark 0 $percent 100)
echo "CPU: $(echo "$percent% [${sparks:1:1}]")"
