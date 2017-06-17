#!/usr/bin/env bash

NEWEMAILS=$(notmuch search tag:unread and not tag:archive | wc -l)
echo "Mail: $NEWEMAILS"
