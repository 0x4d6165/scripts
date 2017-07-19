#!/bin/sh

title () {
    xtitle | cut -c 1-25
}

clock() {
    date '+%Y-%m-%d %H:%M'
}

battery() {
    BATC=/sys/class/power_supply/BAT0/capacity
    BATS=/sys/class/power_supply/BAT0/status

    test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-'

    sed -n p $BATC
}

volume() {
    amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p'
}

cpuload() {
  percent=$(top -bn1 | grep "Cpu(s)" | \
    sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
    awk '{print 100 - $1}')
  echo $percent
}

memused() {
  used=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
  echo "$(echo "($used+0.5)/1" |bc)"
}

groups() {
    cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
    tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

    for w in `seq 0 $((cur - 1))`; do line="${line}="; done
    line="${line}|"
    for w in `seq $((cur + 2)) $tot`; do line="${line}="; done
    echo $line
}

nowplaying() {
    mpc current | cut -c 1-30
}

while :; do
    buf=""
    buf="${buf} [$(groups)]   --  "
    buf="${buf} $(title) -"
    buf="${buf} CLK: $(clock) -"
    buf="${buf} CPU: $(cpuload)% -"
    buf="${buf} RAM: $(memused)% -"
    buf="${buf} VOL: $(volume)% -"
    buf="${buf} BAT: $(battery)% -"
    buf="${buf} MPD: $(nowplaying scroll)"

    echo $buf
    # use `nowplaying scroll` to get a scrolling output!
    sleep 0.5 # The HUD will be updated every second
done
