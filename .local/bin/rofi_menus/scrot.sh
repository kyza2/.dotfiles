#!/bin/bash

menu_options=(
  "<span size='10pt' baseline-shift='-2pt'> 󰲍  </span> Full Screen"
  "<span size='10pt' baseline-shift='-2pt'> 󰲎  </span> Select Area"
)

menu_options_string=$(printf '%s\n' "${menu_options[@]}")

selected_option=$(echo -e "$menu_options_string" | rofi -dmenu -i -markup-rows -p "󰵝 ")

case "$selected_option" in
  "${menu_options[0]}")
    sleep 1

    # Set up timestamp for filename
    timestamp="$(date +%Y-%m-%d-%H-%M-%S)"
    filename="screenshot-${timestamp}.png"
    filepath="${HOME}/Images/screenshots/${filename}"

    scrot "$filepath"

    # Send dunst notification with screenshot
    dunstify -i "$filepath" "Screenshot taken and saved to ${filepath}"
    ;;
  "${menu_options[1]}")
    timestamp="$(date +%Y-%m-%d-%H-%M-%S)"
    filename="screenshot-${timestamp}.png"
    filepath="${HOME}/Images/screenshots/${filename}"

    scrot -s "$filepath"

    # Send dunst notification with screenshot
    dunstify -i "$filepath" "Screenshot taken and saved to ${filepath}"
    ;;
esac
