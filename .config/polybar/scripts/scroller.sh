#!/bin/bash

zscroll -l 33 \
  --delay 0.1 \
  --scroll-padding " • " \
  --match-command "`dirname $0`/status.sh --status" \
  --match-text "Playing" "--scroll 1" \
  --match-text "Paused" "--scroll 0" \
  --update-check true "`dirname $0`/status.sh" &
wait
