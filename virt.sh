#!/bin/sh

# Exit immediately if a command exits with a non-zero exit status
set -e

clear
echo ''
echo '############################################'
echo '########   Virt-Manager Installer   ########'
echo '############################################'

# Install essential packges for Virt-Manager (Virtualization)
sudo xbps-install -y dbus qemu virt-manager

# Enable DBUS and Libvirt services
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/libvirtd /var/service

# Add user for libvirt user group
sudo usermod -aG libvirt $USER
