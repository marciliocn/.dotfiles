#!/bin/sh

# Install essential packges for Virt-Manager (Virtualization)
sudo xbps-install dbus qemu virt-manager

# Enable DBUS and Libvirt services
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/libvirtd /var/service

# Add user for libvirt user group
sudo usermod -aG libvirt $USER
