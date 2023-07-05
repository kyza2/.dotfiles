#!/bin/bash


if [[ $("`dirname $0`/status.sh") != "Nothing is playing" ]]; then
  # Get the duration of the current media being played
  duration=$(playerctl metadata --format '{{mpris:length}}')
  duration_in_seconds=$((duration / 1000000))

  # Get the current position of the media being played
  position=$(playerctl position)
  position_in_seconds=$(printf "%.0f" $position)

  # Calculate the percentage of the media that has been played
  percentage=$((position_in_seconds * 100 / duration_in_seconds))

  # Scale the percentage to fit in a range of 0 to 300
  scaled_percentage=$((percentage * 3 - 2))

  # Output the scaled percentage
  echo "${scaled_percentage}"
fi
