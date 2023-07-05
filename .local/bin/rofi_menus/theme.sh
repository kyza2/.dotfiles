#!/bin/bash

themes_dir="$HOME/.themes/wal"

if [ ! -d "$themes_dir" ]; then
  echo "Themes directory not found: $themes_dir"
  exit 1
fi

option() {
  echo "<span font='Nerd Font Symbols' size='$1' color='$(xrdb -query | grep $2: | tail -c 8)' baseline-shift='$3'>$4</span> $5"
}

menu_options=(
  "$(option '11pt' 'color4' '1.1pt' '󰴌 ' 'Random')"
)

for file in "$themes_dir"/*; do
  if [ -f "$file" ]; then
    menu_options+=("$(basename "$file")")
  fi
done

selected_theme=$(printf '%s\n' "${menu_options[@]}" | rofi -dmenu -i -markup-rows -theme ~/.config/rofi/run.rasi -p "󰥶   " )

if [ $? -eq 1 ]; then
  exit
else
  case "$selected_theme" in
    "${menu_options[0]}") wal --theme random; wal_update.sh ;;
    *) wal --theme "$themes_dir/$selected_theme"; wal_update.sh ;;
  esac
fi
