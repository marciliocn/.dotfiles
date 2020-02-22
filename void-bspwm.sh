#!/bin/bash

# Exit immediately if a command exits with a non-zero exit status
set -e

clear
echo ''
echo '############################################'
echo '######## Dotfiles Installer - BSPWM ########'
echo '############################################'

# Settings
FIREWALL=0 # 1=Install, 0=Do not install (install only if running some server daemon)

# Configure Firewall if 1
if [ $FIREWALL -eq 1 ]; then
	sudo xbps-install -y ufw
	sudo xbps-reconfigure ufw
	sudo ufw enable
	sudo ln -s /etc/sv/ufw /var/service
fi

# Install packages from apps.csv
sudo xbps-install -y $(grep '^s' apps.csv | cut -d , -f 2)

# Configure bspwm and sxhkd start (disable after customize dotfiles for bspwm and sxhkd)
# mkdir -p ~/.config/{bspwm,sxhkd}
# cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm
# cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd
# chmod +x ~/.config/bspwm/bspwmrc
# sed -i 's/urxvt/st/' ~/.config/sxhkd/sxhkdrc
# echo 'exec bspwm' > ~/.xinitrc
# Configure bspwm and sxhkd end

clear
echo ''
echo '############################################################'
echo '######## Dotfiles for BSPWM Installed Successfully! ########'
echo '############################################################'