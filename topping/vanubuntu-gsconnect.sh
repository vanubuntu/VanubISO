echo "Installing GSConnect GNOME Shell extension..."
schroot -c vanubuntu -- apt-get install -y gnome-shell-extension-gsconnect

echo "Installing GSConnect Chromium/Firefox extension..."
schroot -c vanubuntu -- apt-get install -y gnome-shell-extension-gsconnect-browsers
