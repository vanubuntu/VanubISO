cat <<EOF | sudo tee /etc/apt/preferences.d/nosnap.pref
# To prevent repository packages from triggering the installation of Snap,
# this file forbids snapd from being installed by APT.
# For more information: https://linuxmint-user-guide.readthedocs.io/en/latest/snap.html

Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF
cat <<EOF | sudo tee /etc/apt/preferences.d/no-ud.pref
# Due to ubuntu's sneaky installer scripting, this apt configuration will
# prevent ubuntu-desktop from being installed. ubuntu-minimal can still
# be installed though.
# This prevents Vanubuntu configuration from being overitten by the hacky
# Ubuntu files.
#
# DON'T REMOVE THIS FILE unless you know what you're doing. If you want
# to use the ubuntu-desktop setup, install Canonical's standard Ubuntu
# or install the Yaru GTK theme and Ubuntu's bundled extensions.
#
# More info: https://vanubuntu.github.io/VanubISO/blacklist.html
Package: ubuntu-desktop
Pin: release a=*
Pin-Priority: -10
EOF
