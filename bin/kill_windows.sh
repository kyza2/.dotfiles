#!/bin/bash

# set the excluded array
excluded=(
  '"kitty"'
)

# get the current window ID
current_window=$(bspc query -N -n)

# get the window class name
window_class=$(xprop -id $current_window WM_CLASS | awk '{print $4}')

# check if the window class is in the excluded array
if [[ " ${excluded[@]} " =~ " ${window_class} " ]]; then

  if [[ " ${window_class} " =~ '"kitty"' ]]; then
    xdotool sleep 0.1 key --delay 0 --clearmodifiers "ctrl+shift+w" # Close window
  fi
  # do nothing
  exit 0
else
  # kill the current window
  bspc node -c
fi
