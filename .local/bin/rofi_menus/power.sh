#!/bin/bash

menu_options=(
  "<span size='9pt' baseline-shift='-2pt'>󰒲</span>  Shutdown"
  "<span size='12pt' baseline-shift='-3pt'>󰑐</span>  Restart"
  "<span size='17pt' baseline-shift='-3pt'></span>  Lock"
)

menu_options_string=$(printf '%s\n' "${menu_options[@]}")

selected_option=$(echo -e "$menu_options_string" | rofi -dmenu -i -markup-rows -p "󰤆   ")

case "$selected_option" in
  "${menu_options[0]}") shutdown now ;;
  "${menu_options[1]}") reboot ;;
  "${menu_options[2]}") dm-tool lock ;;
esac
