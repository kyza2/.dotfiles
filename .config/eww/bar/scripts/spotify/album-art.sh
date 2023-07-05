#!/bin/bash

tmp_img_file="/tmp/current_album_art.jpg"

playerctl --follow metadata --format {{title}} | while read -r; do
  # Get metadata from Spotify
  spotify_metadata="$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2>&1)"

  # Check for errors
  if echo "$spotify_metadata" | grep -q 'Error org.freedesktop.DBus.Error.ServiceUnknown: The name org.mpris.MediaPlayer2.spotify was not provided by any .service files'; then
    exit 1
  fi

  # Extract album art and current song
  album_art_url="$(echo "$spotify_metadata" | grep -A 1 "artUrl" | tail -1 | cut -d '"' -f 2)"
  current_song="$(echo "$spotify_metadata" | grep -A 1 "title" | tail -1 | cut -d '"' -f 2)"

  # Download album art and resize to 30x30 pixels
  curl -s "$album_art_url" | convert - -scale 40x40 "$tmp_img_file"

  echo -e "$tmp_img_file"
done
