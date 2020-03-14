#!/bin/sh

# Exit immediately if a command exits with a non-zero exit status
set -e

clear
echo ''
echo '############################################'
echo '######## Dotfiles Installer - BSPWM ########'
echo '############################################'

# Settings
FIREWALL=0 # 1=Install, 0=Do not install (install only if running some server daemon)

# Configure Firewall if FIREWALL=1
if [ $FIREWALL -eq 1 ]; then
	sudo xbps-install -y ufw
	sudo xbps-reconfigure ufw
	sudo ufw enable
	sudo ln -s /etc/sv/ufw /var/service
fi

# Install packages from apps.csv
sudo xbps-install -y $(grep '^s' apps.csv | cut -d , -f 2)

clear
# Change shell for $USER
chsh -s /usr/bin/zsh

clear
echo ''
echo 'Audio  and Video Apps'
echo ''
# Check if want install audio/video apps
AV_APPS="sudo xbps-install -y $(grep '^a' apps.csv | cut -d , -f 2)"
read  -p "Are you want install Audio/Video apps? [Y/n]:" answ_av
[ "$answ_av" = "n" ] && AV_APPS=""

# Install Audio/Video Apps
$AV_APPS

clear
echo ''
echo 'Graphics Apps'
echo ''
# Check if want install graphics apps
G_APPS="sudo xbps-install -y $(grep '^g' apps.csv | cut -d , -f 2)"
read  -p "Are you want install Graphics apps? [Y/n]:" answ_g
[ "$answ_g" = "n" ] && G_APPS=""

# Install Audio/Video Apps
$G_APPS

clear
echo ''
echo 'Flatpak Apps'
echo ''
# Define execution string for Flatpak apps
F_APPS="sudo xbps-install -y $(grep '^f,' apps.csv | cut -d , -f 2)"

# Check if want install graphics apps
read  -p "Are you want install Flatpak apps? [Y/n]:" answ_f

if [ "$answ_f" = "n" ]; then
	F_APPS=""
else
	# Install Flatpak Apps
	$F_APPS
	# Add Flathub (http://flathub.org/) repository for Flatpak
	flatpak remote-add --user flathub https://flathub.org/repo/flathub.flatpakrepo
	# Install apps from apps.csv starting with 'fa' (flatpak app)
	flatpak install -y $(grep '^fa' apps.csv | cut -d , -f 2)
fi

# Configure bspwm and sxhkd start (disable after customize dotfiles for bspwm and sxhkd)
# mkdir -p ~/.config/{bspwm,sxhkd}
# cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm
# cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd
# chmod +x ~/.config/bspwm/bspwmrc
# sed -i 's/urxvt/st/' ~/.config/sxhkd/sxhkdrc
# echo 'exec bspwm' > ~/.xinitrc
# Configure bspwm and sxhkd end

# Update MAN database for installed apps (remove verbose messages)
clear
echo ''
echo 'Update MAN database'
echo ''
sudo makewhatis /usr/share/man

clear
echo ''
echo '############################################################'
echo '######## Dotfiles for BSPWM Installed Successfully! ########'
echo '############################################################'
