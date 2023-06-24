cat <<EOF | sudo tee /etc/apt/preferences.d/nosnap.pref
# To prevent repository packages from triggering the installation of Snap,
# this file forbids snapd from being installed by APT.
# For more information: https://linuxmint-user-guide.readthedocs.io/en/latest/snap.html

Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF
cat <<EOF | sudo tee /etc/apt/preferences.d/no-ud.pref
Package: ubuntu-desktop
Pin: release a=*
Pin-Priority: -10
EOF
