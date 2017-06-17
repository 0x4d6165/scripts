#!/usr/bin/env bash

STATE=`nmcli networking connectivity`

if [ $STATE = 'full' ]
then
    #/usr/local/bin/msmtp-runqueue.sh
    $HOME/.scripts/imap.sh
    exit 0
fi
echo "No internet connection."
exit 0
