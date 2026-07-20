#!/usr/bin/env bash

find "$HOME/Pictures/Wallpapers" \
    -maxdepth 1 \
    -type f \
    \( \
        -iname "*.jpg" \
        -o -iname "*.jpeg" \
        -o -iname "*.png" \
        -o -iname "*.webp" \
        -o -iname "*.gif" \
    \) \
| sort
