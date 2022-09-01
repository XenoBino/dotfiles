#!/bin/sh

bspc monitor -d I II III IV V VI VII VIII IX X

picom --daemon
pgrep -x sxhkd > /dev/null || sxhkd &

nitrogen --set-scaled ~/.local/share/wallpapers/bspwm-default.jpg
# $HOME/.config/polybar/launch.sh --panels &
~/.config/polybar/launch.sh --cuts &

# like `bspwmrc` but not tracked by version control
[ -f $HOME/.config/bspwm/bspwmrc.local ] && . $HOME/.config/bspwm/bspwmrc.local;

bspc config border_width         2
bspc config window_gap          12

bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true

bspc rule -a "obs:obs:*" desktop="^3" follow=on
