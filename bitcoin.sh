#!/usr/bin/env bash

price=$(curl -sSL https://coinbase.com/api/v1/prices/historical | head -n 1 | sed 's|^.*,|$|' | sed 's|\(\.[0-9]$\)|\10|')

echo "BTC: $price"
