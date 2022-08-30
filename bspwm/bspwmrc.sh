#!/bin/sh

picom --daemon
sxhkd &
nitrogen --set-scaled ~/.local/share/wallpapers/bspwm-default.jpg
~/.config/polybar/launch.sh --panels &

# `bspwmrc` but not tracked by version control
. ~/.config/bspwm/bspwmrc.local

pgrep -x sxhkd > /dev/null || sxhkd &

# I don't even use one
bspc monitor -d I II III

bspc config border_width         2
bspc config window_gap          12

bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true

# Some defaults that I don't understand (yet)
bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a Chromium desktop='^2'
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off

bspc rule -a xfce4-taskmanager state=floating
