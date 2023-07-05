#!/bin/bash

zscroll -l 45 \
  --delay 0.1 \
  --scroll-padding " • " \
  --match-command "$(dirname $0)/get_spotify_status.sh --status" \
  --match-text "Playing" "--scroll 1" \
  --update-check true "$(dirname $0)/get_spotify_status.sh" &
wait
