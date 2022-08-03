#!/usr/bin/env bash

WINDOW=$(i3-msg -t get_tree | jq -e 'recurse(.nodes[]; .nodes) | select(.focused).window_properties.class')

TITLE=$(i3-msg -t get_tree | jq -e 'recurse(.nodes[]; .nodes) |
  select(.focused).window_properties.title')

case "$WINDOW" in
    '"kitty"') echo "" ;;
    '"qutebrowser"') echo "" ;;
    '"rofi"') echo "" ;;
    '"Nemo"') echo "" ;;
    '"mpv"') echo "金" ;;
    *) echo " " ;;
esac
