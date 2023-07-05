#!/bin/bash

xtitle -sf 'Title changed to "%s"\n' -t 0.1 |
while read -r; do
  active_window_id=$(xdotool getactivewindow)
  window_title=$(xdotool getwindowname "$active_window_id")
  echo "$window_title"
done
