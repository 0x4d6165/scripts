#!/bin/bash

function moveIt { s=${1##*/}; s=${s%%,*}; mv -f $1 $2/$s
s=$(notmuch search --output=files tag:processed and folder:sent | grep -v archived)
for i in $s; do moveIt $i /home/gigavinyl/.mail/archive/new; done
}

s=$(notmuch search --output=files tag:archive and not folder:totrash | grep -v archived)
for i in $s; do moveIt $i /home/gigavinyl/.mail/gigavinyl/archive/new; done

