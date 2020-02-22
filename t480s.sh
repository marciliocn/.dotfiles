#!/bin/bash

# Name: T480s tuning system
# Authors: Marcílio Nascimento <marcilio.mcn at gmail.com>
# First Release: 2020, February
# Description: Tuning commands for ThinkPad T480s on Void Linux
# License: MIT
# Version: 202002.01

# Declare constants and variables
REPO='http://mirror.clarkson.edu/voidlinux'
PKG_LIST=''

# Detect if we're on GenuineIntel system
CPU_VENDOR=$(awk -F ' ' '/vendor_id/ {print $NF; exit}' /proc/cpuinfo)

# If GenuineIntel, install void-repo-nonfree, add package for this architecture in $PKG_LIST 
# and update the xbps-install type for installation
if [ $CPU_VENDOR == 'GenuineIntel' ]; then
  clear
  echo ''
  echo 'Detected GenuineIntel Arch. Adding new repo and Package to install.'
  sudo xbps-install -Sy -R ${REPO}/current/musl void-repo-nonfree
  # PKG_LIST+='intel-ucode '
  sudo xbps-install -Sy intel-ucode
fi

