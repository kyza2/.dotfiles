#!/bin/bash

wallpapers_dir="$HOME/.wallpapers"

if [ ! -d "$wallpapers_dir" ]; then
  echo "Wallpapers directory not found: $wallpapers_dir"
  exit 1
fi

for file in "$wallpapers_dir"/*; do
  if [ -f "$file" ]; then
    echo "$(basename "$file")"
  fi
done

selected_option=$(ls "$wallpapers_dir" | rofi -dmenu -i -theme ~/.config/rofi/run.rasi -p "󰥶   ")

if [ $? -eq 1 ]; then
  ~/scripts/rofi_menus/main.sh
else
  if [ -n "$selected_option" ]; then
    feh --bg-fill "$wallpapers_dir/$selected_option"
  fi
fi
