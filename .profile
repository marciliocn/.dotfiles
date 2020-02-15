#!/bin/sh

# Autologin on tty1
[ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; exec startx
