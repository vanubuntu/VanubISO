#!/bin/bash

source ./vanub-env-vars.sh

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Vanubuntu conversion tool."
echo "This will create an ISO file that can be used to"
echo "run Vanubuntu."
echo "It uses debootstrap and schroot so if you get"
echo "'no such file or directory', you will likely have to"
echo "install these tools."

debootstrap --include="software-properties-common,ubiquity,squashfs-tools,lsb-release,git,gnome-session,ubiquity-frontend-gtk,ubuntu-minimal,grub-pc,grub-efi" --components="main,restricted,universe" --variant=buildd --arch amd64 $VANUBUNTU_VERSION_CODE $HOME/.vanubuntu-daily-build-chroot http://archive.ubuntu.com/ubuntu/
echo """[vanubuntu]
description=Vanubuntu $VANUBUNTU_VERSION daily LIVE ISO build
directory=$HOME/.vanubuntu-daily-build-chroot
personality=linux
root-users=root
type=directory
users=$USER""" > /etc/schroot/chroot.d/vanubuntu.conf
schroot -c vanubuntu -- add-apt-repository ppa:mozillateam/ppa -y
echo "Making apt prefs..."
cp ./make-prefs.sh $HOME/.vanubuntu-daily-build-chroot/
schroot -c vanubuntu -- bash /make-prefs.sh
schroot -c vanubuntu -- rm /make-prefs.sh

echo "Updating packages..."
schroot -c vanubuntu -- apt-get update && schroot -c vanubuntu -- apt-get upgrade -y

echo "Installing GNOME desktop environment..."
schroot -c vanubuntu -- apt-get install -y gnome-core gnome-boxes gnome-connections

echo "Editing lsb-release file..."
echo """PRETTY_NAME=\"Vanubuntu $VANUBUNTU_VERSION\"
NAME=\"Vanubuntu GNU/Linux\"
VERSION_ID=\"$VANUBUNTU_VERSION\"
VERSION=\"$VANUBUNTU_VERSION ($VANUBUNTU_CODENAME)\"
VERSION_CODENAME=$VANUBUNTU_CODENAME
ID=vanubuntu
ID_LIKE=ubuntu
HOME_URL=\"https://vanubuntu.github.io\"
SUPPORT_URL=\"https://github.com/vanubuntu/VanubISO/wiki\"
BUG_REPORT_URL=\"https://github.com/vanubuntu/VanubISO/issues/new/choose\"""" > $HOME/.vanubuntu-daily-build-chroot/etc/os-release

if [ $1 == "" ]; then
echo "I'm a teapot :/"
else
echo "Doing extra work for $1 topping..."
source ./topping/vanubuntu-$1.sh
fi
if [ $2 == "" ]; then
echo "I'm another teapot :/"
else
echo "Doing extra work for $2 topping..."
source ./topping/vanubuntu-$2.sh
fi

echo "Creating Vanubuntu ISO file..."
tar -cvzf vanubuntu-x64.iso . -C $HOME/.vanubuntu-daily-build-chroot

echo "Deleting chroot..."
rm -rf $HOME/.vanubuntu-daily-build-chroot

echo "Vanubuntu $VANUBUNTU_VERSION successfully built"
