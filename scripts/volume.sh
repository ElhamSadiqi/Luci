#!/bin/bash

STEP="$1"
SINK="@DEFAULT_AUDIO_SINK@"

case "$STEP" in
    up)
        wpctl set-volume "$SINK" 5%+
        ;;
    down)
        wpctl set-volume "$SINK" 5%-
        ;;
    mute)
        wpctl set-mute "$SINK" toggle
        ;;
esac

# ------------------------
# READ CURRENT VOLUME
# ------------------------
VOLUME_INFO=$(wpctl get-volume "$SINK")

VOLUME=$(awk '{printf "%d", $2 * 100}' <<< "$VOLUME_INFO")

if echo "$VOLUME_INFO" | grep -q MUTED; then
    MUTED=1
else
    MUTED=0
fi

# ------------------------
# WRITE EVENT
# ------------------------
CACHE_DIR="$HOME/.cache/quickshell/status"
mkdir -p "$CACHE_DIR"

if [ "$MUTED" -eq 1 ]; then
    printf "volume|-1\n" > "$CACHE_DIR/event"
else
    printf "volume|%s\n" "$VOLUME" > "$CACHE_DIR/event"
fi
