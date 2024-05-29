function menu {
whiptail \
  --notags --backtitle "VanubISO TUI" \
  --menu "UP and DOWN to select a menu. Select OK to enter the selected menu." \
  25 75 5 \
  editfile "Edit APT files" \
  editscript "Edit build script (not recommended)" \
  toppings "Select Packages" \
  basicbuild "Perform Basic Build"
}

while true; do
  menu
done
