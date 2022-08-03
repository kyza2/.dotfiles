#!/usr/bin/env bash

LAYOUT=$(i3-msg -t get_tree | jq -r 'recurse(.nodes[];.nodes!=null)|select(.nodes[].focused).layout')

case "$LAYOUT" in
    "splith") echo "V" ;;
    "splitv") echo "H" ;;
    "stacked") echo "S" ;;
    "tabbed") echo "T" ;;
    *) echo "F" ;;
esac
