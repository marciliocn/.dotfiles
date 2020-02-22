#!/bin/sh

# Apps starting with Xorg
sxhkd & # wm independent hotkey

# Increase keyboard speed
xset r rate 200 50

# BSPWM
exec bspwm
