#!/bin/sh

# Default Programs
export PAGER="less"
export EDITOR="nvim"

# Autologin on tty1
[ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; exec startx
