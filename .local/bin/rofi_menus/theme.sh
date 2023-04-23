#!/bin/bash

themes_dir="$HOME/.themes"

if [ ! -d "$themes_dir" ]; then
  echo "Themes directory not found: $themes_dir"
  exit 1
fi

for dir in "$themes_dir"/*; do
  if [ -d "$dir" ]; then
    echo "$(basename "$dir")"
  fi
done

selected_theme=$(ls "$themes_dir" | rofi -dmenu -i  -theme ~/.config/rofi/run.rasi -p "󰸌   ")

if [ $? -eq 1 ]; then
  ~/scripts/rofi_menus/main.sh
else
  if [ -n "$selected_theme" ]; then
    wal --theme "$themes_dir/$selected_theme"; wal_update.sh;
  fi
fi
