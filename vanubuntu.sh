#!/bin/bash

source ./vanub-env-vars.sh

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Installing build tools..."
apt-get install -y debootstrap schroot

echo "Setting up fake Vanubuntu..."
debootstrap --variant=buildd --arch amd64 $VANUBUNTU_VERSION_CODE /tmp/vanubuntu-daily-build-chroot http://archive.ubuntu.com/ubuntu/

echo "Preparing fake Vanubuntu..."
echo """[vanubuntu]
description=Vanubuntu $VANUBUNTU_VERSION daily build
directory=/tmp/vanubuntu-daily-build-chroot
personality=linux
root-users=root
type=directory
users=$USER""" > /etc/schroot/chroot.d/vanubuntu.conf

echo "Adding universe..."
schroot -c vanubuntu -- add-apt-repository universe -y

echo "Entering the MULTIVERSE... (non-free software, richard stallman will be angry)"
schroot -c vanubuntu -- add-apt-repository multiverse -y

echo "Updating packages..."
schroot -c vanubuntu -- apt-get update && schroot -c vanubuntu -- apt-get upgrade -y

echo "Installing GNOME desktop environment..."
schroot -c vanubuntu -- apt-get install -y gnome-session gnome-boxes gnome-connections firefox

echo "Removing Ubuntu-related packages..."
schroot -c vanubuntu -- apt-get remove --purge ubuntu-desktop gnome* && schroot -c vanubuntu -- apt-get autoremove -y && schroot -c vanubuntu -- apt-get autoclean && schroot -c vanubuntu -- apt-get clean

echo "Removing Ubuntu Livepatch and Remmina..."
schroot -c vanubuntu -- apt-get remove --purge remmina -y

echo "Editing lsb-release file..."
echo """PRETTY_NAME="Vanubuntu $VANUBUNTU_VERSION"
NAME="Vanubuntu GNU/Linux"
VERSION_ID="$VANUBUNTU_VERSION"
VERSION="$VANUBUNTU_VERSION ($VANUBUNTU_CODENAME)"
VERSION_CODENAME=$VANUBUNTU_CODENAME
ID=vanubuntu
ID_LIKE=ubuntu
HOME_URL="https://vanubuntu.github.io"
SUPPORT_URL="https://github.com/vanubuntu/VanubISO/wiki"
BUG_REPORT_URL="https://github.com/vanubuntu/VanubISO/issues/new/choose""" > /tmp/vanubuntu-daily-build-chroot/etc/os-release

echo "Creating Vanubuntu ISO file..."
bash -c "tar -cvzf vanubuntu-x64.iso $GITHUB_WORKSPACE -C /tmp/vanubuntu-daily-build-chroot"

echo "Deleting chroot..."
rm -rf /tmp/vanubuntu-daily-build-chroot

echo "Vanubuntu $VANUBUNTU_VERSION successfully built"
