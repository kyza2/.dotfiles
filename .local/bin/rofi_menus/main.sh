#!/bin/bash

option() {
  echo "<span font='Nerd Font Symbols' size='$1' color='$(xrdb -query | grep $2: | tail -c 8)' baseline-shift='$3'>$4</span> $5"
}

menu_options=(
  "$(option '13pt' 'color1' '-2.5pt' ' ' 'Sound')"
  "$(option '11pt' 'color2' '-1.3pt' '󰶍 ' 'Mail')"
  "$(option '12pt' 'color3' '-1.8pt' ' ' 'Bookmarks')"
  "$(option '11pt' 'color4' '-1.8pt' '󰄀 ' 'Screenshot')"
  "$(option '11pt' 'color5' '-1.8pt' ' ' 'Appearance')"
  "$(option '11pt' 'color6' '-1.1pt' '󱞁 ' 'Notes')"
  "$(option '12pt' 'color1' '-1.8pt' ' ' 'Wallpaper')"
  "$(option '12pt' 'color2' '-1.8pt' ' ' 'Theme')"
  "$(option '10pt' 'color3' '-1.8pt' ' ' 'Processes')"
  "$(option '10pt' 'color4' '-1.8pt' '󰤆 ' 'Power')"
)

menu_options_string=$(printf '%s\n' "${menu_options[@]}")
selected_option=$(echo -e "$menu_options_string" | rofi -dmenu -theme ~/.config/rofi/run.rasi -i -markup-rows -p "    ")

# Handle Escape key
if [[ $selected_option == "" ]]; then
  exit 0
fi

case "$selected_option" in
  !w*) firefox "https://en.wikipedia.org/w/index.php?title=Special:Search&search=$(echo "$selected_option" | sed 's/^!w //;s/ /+/g')";;
  !yt*) firefox "https://www.youtube.com/results?search_query=$(echo "$selected_option" | sed 's/^!y //;s/ /+/g')";;
  !gh*) firefox "https://github.com/search?q=$(echo "$selected_option" | sed 's/^!gh //;s/ /+/g')&type=code";;
  !r*) firefox "https://www.reddit.com/search?q=$(echo "$selected_option" | sed 's/^!r //;s/ /+/g')";;
  !a*) firefox "https://wiki.archlinux.org/index.php?title=Special%3ASearch&search=$(echo "$selected_option" | sed 's/^!a //;s/ /+/g')";;
  "${menu_options[0]}") ~/scripts/rofi_menus/sound.sh ;;
  "${menu_options[1]}") firefox https://outlook.live.com/mail/0 ;;
  "${menu_options[2]}") ~/scripts/rofi_menus/bookmarks.sh ;;
  "${menu_options[3]}") ~/scripts/rofi_menus/scrot.sh ;;
  "${menu_options[4]}") lxappearance ;;
  "${menu_options[5]}") cd ~/Notes/; kitty ;;
  "${menu_options[6]}") ~/scripts/rofi_menus/wallpaper.sh ;;
  "${menu_options[7]}") ~/scripts/rofi_menus/theme.sh ;;
  "${menu_options[8]}") kitty btm -b ;;
  "${menu_options[9]}") ~/scripts/rofi_menus/power.sh ;;
  *) firefox "https://duckduckgo.com/?q=$(echo "$selected_option" | sed 's/ /%20/g')" ;;
esac
