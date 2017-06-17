#!/usr/bin/env bash
used=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
sparks=$(spark 0 $used 100)
echo "Mem: $(echo "($used+0.5)/1" | bc)% [${sparks:1:1}]"
