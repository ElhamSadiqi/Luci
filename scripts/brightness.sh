#!/bin/bash

brightnessctl set "$1"

BRIGHTNESS=$(brightnessctl info | grep -oP '\(\K[^%]+(?=%\))')

# ------------------------
# WRITE EVENT
# ------------------------

CACHE_DIR="$HOME/.cache/quickshell/status"
mkdir -p "$CACHE_DIR"

printf "brightness|%s\n" "$BRIGHTNESS" > "$CACHE_DIR/event"
