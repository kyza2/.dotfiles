#!/bin/bash

# Start monitoring playerctl status
playerctl --follow status | while read -r status; do
  echo $status
done
