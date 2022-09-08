#!/bin/sh

## Variables:
## $wallpaper Path to the wallpaper image
## $desktops A space seperated list of desktop names
## $sxhkd_extra_config A space seperated list of sxhkd extra config files

# Configure this config file
[ -f $HOME/.config/bspwm/bspwmrc.local ] && . $HOME/.config/bspwm/bspwmrc.local;

# Defaults if not configured in the config file
: ${wallpaper:=~/.local/share/wallpapers/xeno/boat.jpg}
: ${desktops:=I II III IV V VI VII VIII IX X}

# Set monitor names (and count) according to the $desktops variable
bspc monitor -d $desktops
bspc config border_width            2
bspc config window_gap              8

bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true

# Start picom (composter) and sxhkd (key daemon)
picom --daemon

# If sxhkd is not running, start it
if ! pgrep -x sxhkd ; then
  sxhkd -c ~/.config/sxhkd/sxhkdrc $sxhkd_extra_config &
fi

# Set the wallpaper
nitrogen --set-scaled $wallpaper

# Start the polybar
~/.config/polybar/launch.sh --material &

# Launch obs in the fifth desktop
bspc rule -a "obs:obs:*" desktop="^5" follow=on
