#!/bin/bash

menu_options=(
  "<span size='11pt' baseline-shift='-1.2pt'></span>  GitHub"
  "<span size='12pt' baseline-shift='-1.2pt'>󰓇</span>  Spotify"
  "<span size='12pt' baseline-shift='-2.0pt'></span>  Firefox"
  "<span size='14pt' baseline-shift='-3.0pt'></span>  Neovim"
  "<span size='11pt' baseline-shift='-3.0pt'>󰄛</span>  Kitty"
  "<span size='11pt' baseline-shift='-3.0pt'>󰉕</span>  Nemo"
  "<span size='14pt' baseline-shift='-3.0pt'>󱎓</span>  Gameboy"
  "<span size='14pt' baseline-shift='-3.0pt'></span>  MonkeyType"
  "<span size='14pt' baseline-shift='-3.0pt'></span>  Qutebrowser"
  "<span size='14pt' baseline-shift='-3.0pt'></span>  PixAI"
  "<span size='13pt' baseline-shift='-3.0pt'>󰦝</span>  KeepassXC"
  "<span size='14pt' baseline-shift='-3.0pt'></span>  Chromium"
)

menu_options_string=$(printf '%s\n' "${menu_options[@]}")
selected_option=$(echo -e "$menu_options_string" | rofi -dmenu -i -markup-rows -theme ~/.config/rofi/run.rasi -p "   ")

case "$selected_option" in
  "${menu_options[0]}") firefox https://github.com ;;
  "${menu_options[1]}") spicetify watch -s ;;
  "${menu_options[2]}") firefox ;;
  "${menu_options[3]}") kitty nvim ;;
  "${menu_options[4]}") kitty ;;
  "${menu_options[5]}") nemo ;;
  "${menu_options[6]}") mgba-qt ;;
  "${menu_options[7]}") firefox https://monkeytype.com ;;
  "${menu_options[8]}") qutebrowser ;;
  "${menu_options[9]}") firefox https://pixai.art ;;
  "${menu_options[10]}") keepassxc ;;
  "${menu_options[11]}") chromium ;;
esac
