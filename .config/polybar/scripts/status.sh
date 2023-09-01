#!/bin/bash

# Check player status
PLAYERCTL_STATUS=$(playerctl --player="spotify" status 2>/dev/null || echo "No player is running")

# If the argument is "--status", output player status and exit
if [[ "$1" == "--status" ]]; then
    echo "$PLAYERCTL_STATUS"
    exit
fi

# If player is stopped or not running, output message and exit
if [[ "$PLAYERCTL_STATUS" == "Stopped" || "$PLAYERCTL_STATUS" == "No player is running" ]]; then
    echo "Nothing playing"
    exit
fi

# Output player metadata
playerctl --player="spotify" metadata --format "{{ artist }} - {{ title }}"
