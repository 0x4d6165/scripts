#!/usr/bin/env bash

#run OfflineIMAP once, with quiet interface
imapactive=`ps -ef | grep offlineimap | grep -v grep | wc -l`
mailsync="/usr/bin/offlineimap -u quiet -q"
username=`whoami`
mailhost=`cat /home/$username/.offlineimaprc | grep remotehost | awk '{print $3}'`
online=`host $mailhost | grep "has address" | wc -l`

# kill offlineimap if active, in some rare cases it may hang
case $imapactive in
'1')
   killall offlineimap && sleep 5
;;
esac

# if you can do a DNS lookup, sync your mail
case $online in
'1')
   $mailsync
;;
esac

##count new mail for every maildir
#maildirnew="$HOME/mail/*/*/new/"
#new="$(find $maildirnew -type f | wc -l)"

##count old mail for every maildir
#maildirold="$HOME/mail/*/*/cur/"
#old="$(find $maildirold -type f | wc -l)"

#if [ $new -gt 0 ]
#then
    #export DISPLAY=:0; export XAUTHORITY=~/.Xauthority;
    #notify-send -a "OfflineIMAP" "New mail! New: $new Old: $old"
#fi
