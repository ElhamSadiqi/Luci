#!/usr/bin/env bash

set -e

THEME="$1"

if [[ -z "$THEME" ]]; then
    echo "Usage: theme-switch.sh <theme>"
    exit 1
fi

THEMES_DIR="$HOME/.config/quickshell/styles/themes"
THEME_DIR="$THEMES_DIR/$THEME"

if [[ ! -d "$THEME_DIR" ]]; then
    echo "Theme '$THEME' not found."
    exit 1
fi

link_if_exists() {
    local source="$1"
    local target="$2"

    if [[ -f "$source" ]]; then
        mkdir -p "$(dirname "$target")"
        ln -sf "$source" "$target"
        echo "✓ $(basename "$target")"
    else
        echo "✗ Missing: $source"
    fi
}

# -------------------------
# Wallpapers
# -------------------------

case "$THEME" in
    monochrome)
        WP="art11.png"
        ;;

    githublight)
        WP="Totoro.png"
        ;;

    gruvbox)
        WP="gruvbox_astro.jpg"
        ;;

    gruvboxlight)
        WP="anime-girl3.jpg"
        ;;

    dracula)
        WP="art13.jpeg"
        ;;

    everforest)
        WP="foggy_valley_2.png"
        ;;

    catppuccin)
        WP="arch-black-4k.png"
        ;;

    catppuccinlatte)
        WP="7.jpg"
        ;;

    nord)
        WP="chainsaw-man.png"
        ;;

    rosepine)
        WP="car.jpg"
        ;;

    solarized)
        WP="sleeping.jpg"
        ;;

    tokyonight)
        WP="aesthetic-anime2.jpg"
        ;;

    *)
        WP="default.jpg"
        ;;
esac

# -------------------------
# Wallpaper
# -------------------------

awww img \
"$HOME/Pictures/Wallpapers/$WP" \
--transition-type grow

# -------------------------
# Kitty
# -------------------------

if [[ -f "$THEME_DIR/kitty.conf" ]]; then
    cp -f \
        "$THEME_DIR/kitty.conf" \
        "$HOME/.config/kitty/kitty.conf"

    echo "✓ kitty.conf"
fi

# -------------------------
# Hyprland
# -------------------------

link_if_exists \
    "$THEME_DIR/HyprTheme.lua" \
    "$HOME/.config/hypr/current-theme/theme.lua"

echo
echo "Applied theme: $THEME"

echo "$THEME" > "$HOME/.config/quickshell/.current_theme"

