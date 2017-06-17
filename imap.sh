#!/usr/bin/env bash

$HOME/.scripts/mail/archive.sh ; mbsync -a -V ; notmuch new
