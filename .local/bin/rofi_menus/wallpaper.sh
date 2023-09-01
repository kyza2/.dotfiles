#!/bin/bash

wallpapers_dir="$HOME/.wallpapers"

if [ ! -d "$wallpapers_dir" ]; then
  echo "Wallpapers directory not found: $wallpapers_dir"
  exit 1
fi

option() {
  echo "<span font='Nerd Font Symbols' size='$1' color='$(xrdb -query | grep $2: | tail -c 8)' baseline-shift='$3'>$4</span> $5"
}

# Modified to add "set random" as the first option
menu_options=(
  "$(option '11pt' 'color4' '1.1pt' '󱧿 ' 'Random')"
  "$(option '11pt' 'color5' '-1.3pt' '󰇚 ' 'Random from Wallhaven')"
  "$(option '11pt' 'color6' '-1.3pt' ' ' 'Save Wallpaper')"
  "$(option '11pt' 'color2' '1.1pt' '󱧿 ' 'Solid Color')"
)

for file in "$wallpapers_dir"/*; do
  if [ -f "$file" ]; then
    menu_options+=("$(basename "$file")")
  fi
done

# Modified to pass menu options array to rofi
selected_option=$(printf '%s\n' "${menu_options[@]}" | rofi -dmenu -i -markup-rows -p "󰥶   ")

if [ $? -eq 1 ]; then
  exit
else
  case "$selected_option" in
    "${menu_options[0]}") feh --randomize --bg-fill "$wallpapers_dir" ;;
    "${menu_options[1]}") 
      cache_dir="$HOME/.cache/wallpapers"

      if [ ! -d "$cache_dir" ]; then
        mkdir -p "$cache_dir"
      fi

      # Remove the previous wallpaper file, if it exists
      previous_wallpaper=$(find "$cache_dir" -name 'wallhaven-*' -type f)
      if [ -n "$previous_wallpaper" ]; then
          rm "$previous_wallpaper"
      fi

      # Generate a random number between 1 and 6
      page=$(od -An -N1 -tu1 /dev/urandom | tr -d ' ' | awk '{print ($1 % 6) + 1}')
      echo $page

      # Generate a random number between 0 and 23
      index=$(od -An -N1 -tu1 /dev/urandom | tr -d ' ' | awk '{print $1 % 22}')
      echo $index

      # Select from toplist pages 1-3
      api_url="https://wallhaven.cc/api/v1/search?categories=111&purity=100&topRange=1M&sorting=toplist&order=desc&ai_art_filter=1&page=$page"

      dunstify "Fetching wallpapers" -r 4444 
      response=$(curl -s "$api_url")

      # Random index
      image_url=$(echo "$response" | jq -r ".data[$index].path")
      image_file=$(basename "$image_url")

      (wget --show-progress --progress=dot -q "$image_url" -O "$cache_dir/$image_file" 2>&1 | grep -o -E '[0-9]+%' | while read -r progress; do
        dunstify "Downloading wallpaper: $progress" -r 4444 
      done)

      # Set the downloaded wallpaper as the background image
      feh --bg-fill "$cache_dir/$image_file"
    ;;
    "${menu_options[2]}") 
      cache_dir="$HOME/.cache/wallpapers"
      wallpaper=$(find "$cache_dir" -name 'wallhaven-*' -type f)

      cp $wallpaper $wallpapers_dir
      dunstify -i "$wallpaper" "Wallpaper saved!" "$wallpapers_dir/$(find "$cache_dir" -name 'wallhaven-*' -printf "%f\n")"
    ;;
    "${menu_options[3]}") 
      exec "${HOME}/.wallpapers/scripts/shade_bg.sh"
    ;;
    *) feh --bg-fill "$wallpapers_dir/$selected_option"
  esac
fi
