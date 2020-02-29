#!/bin/sh

# Apps starting with Xorg
sxhkd & # wm independent hotkey
(sleep 1 && xcompmgr) & # composite manager for transparency and tearing
devmon & # daemon for (USB) removable devices

# Increase keyboard speed
xset r rate 200 50

# Change keyboard to US_INTL (allows the accents)
setxkbmap -variant intl

# To load .Xresources on startup
[ -f $HOME/.Xresources ] && xrdb -merge $HOME/.Xresources

# BSPWM
exec bspwm
