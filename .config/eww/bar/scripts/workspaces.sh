#!/bin/bash

xprop -spy -root _NET_CURRENT_DESKTOP | while read -r; do
  json=""

  for i in {1..4}; do
      SPACE=$(bspc wm --get-status | cut -d ":" -f $((i + 1)))
      case $SPACE in
          u*) state="urgent" ;;
          o*) state="occupied" ;;
          O*) state="active" ;;
          f*) state="free" ;;
          F*) state="active" ;;
      esac
      json+="{\"id\": $i, \"state\": \"$state\"}"
      if (( i < 4 )); then json+=", "; fi
  done

  echo -e "[$json]\n" # Add closing square bracket
done
