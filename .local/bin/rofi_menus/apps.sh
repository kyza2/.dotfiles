#!/bin/bash

option() {
  echo "<span font='Nerd Font Symbols' size='$1' color='$(xrdb -query | grep $2: | tail -c 8)' baseline-shift='$3'>$4</span> $5"
}

menu_options=(
  "$( option '11pt' 'color7' '-1.2pt' ' ' 'GitHub')"
  "$( option '12pt' 'color7' '-1.2pt' '󰓇 ' 'Spotify')"
  "$( option '12pt' 'color7' '-2.0pt' ' ' 'Firefox')"
  "$( option '14pt' 'color7' '-3.0pt' ' ' 'Neovim')"
  "$( option '14pt' 'color7' '-3.0pt' ' ' 'Neovide')"
  "$( option '11pt' 'color7' '-3.0pt' '󰄛 ' 'Kitty')"
  "$( option '11pt' 'color7' '-3.0pt' '󰉕 ' 'Nemo')"
  "$( option '14pt' 'color7' '-3.0pt' ' ' 'MonkeyType')"
  "$( option '13pt' 'color7' '-3.0pt' '󰦝 ' 'KeepassXC')"
  "$( option '14pt' 'color7' '-3.0pt' ' ' 'Chromium')"
  "$( option '11pt' 'color7' '-3.0pt' ' ' 'Cava')"
  "$( option '11pt' 'color7' '-3.0pt' ' ' 'Sptlrx')"
)

menu_options_string=$(printf '%s\n' "${menu_options[@]}")
selected_option=$(echo -e "$menu_options_string" | rofi -dmenu -i -markup-rows -p "   ")

case "$selected_option" in
  "${menu_options[0]}") firefox https://github.com/kyza2 ;;
  "${menu_options[1]}") spotify-launcher ;;
  "${menu_options[2]}") firefox ;;
  "${menu_options[3]}") kitty nvim ;;
  "${menu_options[4]}") neovide --multigrid ;;
  "${menu_options[5]}") kitty ;;
  "${menu_options[6]}") nemo ;;
  "${menu_options[7]}") firefox https://monkeytype.com ;;
  "${menu_options[8]}") keepassxc ;;
  "${menu_options[9]}") chromium ;;
  "${menu_options[10]}") kitty -c ~/.config/cava/kitty cava  ;;
  "${menu_options[11]}") kitty -c ~/.config/sptlrx/kitty.conf sptlrx  ;;
esac
