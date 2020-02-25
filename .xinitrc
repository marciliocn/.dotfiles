#!/bin/sh

# Apps starting with Xorg
sxhkd & # wm independent hotkey

# Increase keyboard speed
xset r rate 200 50

# Change keyboard to US_INTL (allows the accents)
setxkbmap -variant intl

# To load .Xresources on startup
[ -f $HOME/.Xresources ] && xrdb -merge $HOME/.Xresources

# BSPWM
exec bspwm
