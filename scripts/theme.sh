#!/bin/bash

THEME="$1"

if [ -z "$THEME" ]; then
    echo "Usage: theme.sh <theme>"
    exit 1
fi

THEME_DIR="$HOME/.config/quickshell/styles/themes/$THEME"

# ---------------------------------------
# Kitty
# ---------------------------------------

if [ -f "$THEME_DIR/kitty.conf" ]; then
    cp "$THEME_DIR/kitty.conf" "$HOME/.config/kitty/kitty.conf"
else
    echo "kitty.conf not found for theme: $THEME"
fi

echo "Applied theme: $THEME"
