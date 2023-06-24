#!/bin/bash

source ./vanub-env-vars.sh

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Installing build tools..."
sudo apt-get install -y debootstrap schroot

echo "Setting up fake Vanubuntu..."
sudo debootstrap --variant=buildd --arch amd64 $VANUBUNTU_VERSION_CODE /tmp/vanubuntu-daily-build-chroot http://archive.ubuntu.com/ubuntu/

echo "Preparing fake Vanubuntu..."
sudo tee /etc/schroot/chroot.d/vanubuntu.conf <<EOF
[vanubuntu]
description=Vanubuntu $VANUBUNTU_VERSION daily build
directory=/tmp/vanubuntu-daily-build-chroot
personality=linux
root-users=root
type=directory
users=$USER
EOF

echo "Updating packages..."
sudo schroot -c vanubuntu -- apt-get update && sudo schroot -c vanubuntu -- apt-get upgrade -y

echo "Installing GNOME desktop environment..."
sudo schroot -c vanubuntu -- apt-get install -y gnome-session gnome-boxes gnome-connections firefox

echo "Removing Ubuntu-related packages..."
sudo schroot -c vanubuntu -- apt-get remove --purge ubuntu-desktop gnome* && sudo schroot -c vanubuntu -- apt-get autoremove -y && sudo schroot -c vanubuntu -- apt-get autoclean && sudo schroot -c vanubuntu -- apt-get clean

echo "Removing Ubuntu Livepatch and Remmina..."
sudo schroot -c vanubuntu -- apt-get remove --purge remmina -y

echo "Editing lsb-release file..."
echo <<EOF
PRETTY_NAME="Vanubuntu $VANUBUNTU_VERSION"
NAME="Vanubuntu GNU/Linux"
VERSION_ID="$VANUBUNTU_VERSION"
VERSION="$VANUBUNTU_VERSION ($VANUBUNTU_CODENAME)"
VERSION_CODENAME=$VANUBUNTU_CODENAME
ID=vanubuntu
ID_LIKE=ubuntu
HOME_URL="https://vanubuntu.github.io"
SUPPORT_URL="https://github.com/vanubuntu/VanubISO/wiki"
BUG_REPORT_URL="https://github.com/vanubuntu/VanubISO/issues/new/choose"
EOF | sudo tee /tmp/vanubuntu-daily-build-chroot/etc/os-release

echo "Creating Vanubuntu ISO file..."
sudo bash -c "cd /tmp/vanubuntu-daily-build-chroot && tar -cvzf ubuntu-vanilla-gnome-$VANUBUNTU_VERSION_CODE-x64.iso /root"

echo "Deleting chroot..."
sudo rm -rf /tmp/vanubuntu-daily-build-chroot

echo "Vanubuntu $VANUBUNTU_VERSION successfully built"
