#!/bin/bash

menu_options=(
  "<span size='12pt' baseline-shift='-3pt'></span>  Play/Pause"
  "<span size='13pt' baseline-shift='-3pt'>󰒭</span>  Next Track"
  "<span size='13pt' baseline-shift='-3pt'>󰒮</span>  Previous Track"
  "<span size='10pt' baseline-shift='-3pt'>󰝝</span>  Volume Up"
  "<span size='10pt' baseline-shift='-3pt'>󰝞</span>  Volume Down"
)

menu_options_string=$(printf '%s\n' "${menu_options[@]}")
selected_option=$(echo -e "$menu_options_string" | rofi -dmenu -i -markup-rows -p "󰋋   ")

case "$selected_option" in
  "${menu_options[0]}") playerctl play-pause ;;
  "${menu_options[1]}") playerctl next ;;
  "${menu_options[2]}") playerctl previous ;;
  "${menu_options[3]}") amixer -q sset Master 25%+ ;;
  "${menu_options[4]}") amixer -q sset Master 25%- ;;
esac
