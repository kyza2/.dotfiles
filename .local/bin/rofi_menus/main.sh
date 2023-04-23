#!/bin/bash

menu_options=(
  "<span size='13pt' color='$(xrdb -query | grep "color1:" | tail -c 8)' baseline-shift='-2.5pt'></span>  Sound"
  "<span size='11pt' color='$(xrdb -query | grep "color2:" | tail -c 8)' baseline-shift='-1.3pt'>󰶍</span>  Mail"
  "<span size='12pt' color='$(xrdb -query | grep "color3:" | tail -c 8)' baseline-shift='-1.8pt'></span>  Bookmarks"
  "<span size='11pt' color='$(xrdb -query | grep "color4:" | tail -c 8)' baseline-shift='-1.8pt'>󰄀</span>  Screenshot"
  "<span size='11pt' color='$(xrdb -query | grep "color5:" | tail -c 8)' baseline-shift='-1.1pt'>󱞁</span>  Notes"
  "<span size='12pt' color='$(xrdb -query | grep "color6:" | tail -c 8)' baseline-shift='-1.8pt'></span>  Wallpaper"
  "<span size='12pt' color='$(xrdb -query | grep "color9:" | tail -c 8)' baseline-shift='-1.8pt'></span>  Theme"
  "<span size='10pt' color='$(xrdb -query | grep "color2:" | tail -c 8)' baseline-shift='-1.8pt'></span>  Processes"
  "<span size='10pt' color='$(xrdb -query | grep "color1:" | tail -c 8)' baseline-shift='-1.8pt'>󰤆</span>  Power"


)

menu_options_string=$(printf '%s\n' "${menu_options[@]}")
selected_option=$(echo -e "$menu_options_string" | rofi -dmenu -theme ~/.config/rofi/run.rasi -i -markup-rows -p "    ")

# Handle Escape key
if [[ $selected_option == "" ]]; then
  exit 0
fi

if [[ $selected_option == !w* ]]; then

  # wikipedia
  firefox "https://en.wikipedia.org/w/index.php?title=Special:Search&search=$(echo "$selected_option" | sed 's/^!w //;s/ /+/g')"
elif [[ $selected_option == !yt* ]]; then

  # Youtube
  firefox "https://www.youtube.com/results?search_query=$(echo "$selected_option" | sed 's/^!y //;s/ /+/g')"
elif [[ $selected_option == !gh* ]]; then

  # Github
  firefox "https://github.com/search?q=$(echo "$selected_option" | sed 's/^!gh //;s/ /+/g')&type=code"
elif [[ $selected_option == !r* ]]; then

  # Reddit
  firefox "https://www.reddit.com/search?q=$(echo "$selected_option" | sed 's/^!r //;s/ /+/g')"
elif [[ $selected_option == !a* ]]; then

  # Archlinux
  firefox "https://wiki.archlinux.org/index.php?title=Special%3ASearch&search=$(echo "$selected_option" | sed 's/^!a //;s/ /+/g')"
else
  case "$selected_option" in
      # Sound
    "${menu_options[0]}") ~/scripts/rofi_menus/sound.sh ;;

      # Mail
    "${menu_options[1]}") firefox https://outlook.live.com/mail/0 ;;

      # Bookmarks
    "${menu_options[2]}") ~/scripts/rofi_menus/bookmarks.sh ;;

      # Screenshot
    "${menu_options[3]}") ~/scripts/rofi_menus/scrot.sh ;;

      # Notes
    "${menu_options[4]}") cd ~/Notes/; kitty ;;

      # Wallpaper
    "${menu_options[5]}") ~/scripts/rofi_menus/wallpaper.sh ;;

      # Theme
    "${menu_options[6]}") ~/scripts/rofi_menus/theme.sh ;;

      # Processes
    "${menu_options[7]}") kitty btm -b ;;

      # Power
    "${menu_options[8]}") ~/scripts/rofi_menus/power.sh ;;

    *) firefox "https://duckduckgo.com/?q=$(echo "$selected_option" | sed 's/ /%20/g')" ;;
  esac
fi
