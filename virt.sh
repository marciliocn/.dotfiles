#!/bin/sh

# Exit immediately if a command exits with a non-zero exit status
set -e

# Verify if virt-manager already installed
verify_pkg="$(xbps-query virt-manager | awk '/state/ {print $2}')"

if [ "$verify_pkg" = "installed" ]; then
	echo 'Aborted: Virt-Manager already installed!' 1>&2
	exit 1	
fi

clear
echo ''
echo '########################################'
echo '######## Virt-Manager Installer ########'
echo '########################################'
echo ''
echo 'Install dbus, qemu and virt-manager packages'
echo ''
echo 'Insert your user password'

# Install essential packages for Virt-Manager (Virtualization)
sudo xbps-install -y dbus qemu virt-manager

clear
echo ''
echo 'Enable services DBUS and Libvirtd'
echo ''
# Enable DBUS and Libvirt services
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/libvirtd /var/service

clear
echo ''
echo 'Add ${USER} for libvirt group'
echo ''
# Add user for libvirt group
sudo usermod -aG libvirt $USER

clear
echo ''
echo '#####################################################'
echo '######## Virt-Manager Installed Successfully ########'
echo '#####################################################'

sudo reboot
