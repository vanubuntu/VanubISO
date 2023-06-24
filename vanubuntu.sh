#!/bin/bash

source ./vanub-env-vars.sh

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Installing build tools..."
apt-get install -y debootstrap schroot

echo "Setting up fake Vanubuntu..."
debootstrap --include="software-properties-common,ubiquity,squashfs-tools,lsb-release,git,gnome-session,ubiquity-frontend-gtk" --components="main,restricted,universe,multiverse" --variant=buildd --arch amd64 $VANUBUNTU_VERSION_CODE /tmp/vanubuntu-daily-build-chroot http://archive.ubuntu.com/ubuntu/
echo """[vanubuntu]
description=Vanubuntu $VANUBUNTU_VERSION daily LIVE ISO build
directory=/tmp/vanubuntu-daily-build-chroot
personality=linux
root-users=root
type=directory
users=$USER""" > /etc/schroot/chroot.d/vanubuntu.conf
schroot -c vanubuntu -- add-apt-repository ppa:mozillateam/ppa -y
echo "Making apt prefs..."
cp ./make-prefs.sh /tmp/vanubuntu-daily-build-chroot/
schroot -c vanubuntu -- bash /make-prefs.sh
schroot -c vanubuntu -- rm /make-prefs.sh

echo "Updating packages..."
schroot -c vanubuntu -- apt-get update && schroot -c vanubuntu -- apt-get upgrade -y

echo "Installing GNOME desktop environment..."
schroot -c vanubuntu -- apt-get install -y gnome-core gnome-boxes gnome-connections gnome-core firefox

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
BUG_REPORT_URL=\"https://github.com/vanubuntu/VanubISO/issues/new/choose\"""" > /tmp/vanubuntu-daily-build-chroot/etc/os-release

echo "Creating Vanubuntu ISO file..."
bash -c "tar -cvzf vanubuntu-x64.iso $GITHUB_WORKSPACE -C /tmp/vanubuntu-daily-build-chroot"

echo "Deleting chroot..."
rm -rf /tmp/vanubuntu-daily-build-chroot

echo "Vanubuntu $VANUBUNTU_VERSION successfully built"
