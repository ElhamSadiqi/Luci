pragma Singleton

import QtQuick

// =========================================================
// CATPPUCCIN LATTE
// =========================================================

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#EFF1F5"
    property color surface: "#E6E9EF"
    property color surfaceVariant: "#DCE0E8"
    property color card: "#DCE0E8"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlayLight: "#00000010"
    property color overlayMedium: "#00000022"
    property color overlayStrong: "#00000044"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#4C4F69"
    property color textSecondary: "#6C6F85"
    property color textMuted: "#8C8FA1"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: "#6C6F85"
    property color iconActive: "#4C4F69"
    property color iconDisabled: "#8C8FA1"

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#1E66F5"
    property color accentHover: "#209FB5"
    property color accentPressed: "#1554D4"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#BCC0CC"
    property color borderHover: "#ACB0BE"
    property color borderSelected: accent
    property color borderSubtle: "#00000018"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#DCE0E8"
    property color buttonHover: "#D5D9E3"
    property color buttonPressed: "#BCC0CC"
    property color buttonSelected: accent
    property color buttonText: textPrimary
    property color controlButtonHover: "#D5D9E3"

    // =========================================================
    // DESTRUCTIVE ACTIONS
    // =========================================================

    property color danger: "#D20F39"
    property color dangerHover: "#B80D32"
    property color warning: "#DF8E1D"
    property color success: "#40A02B"

    // =========================================================
    // INPUTS / SLIDERS
    // =========================================================

    property color sliderBackground: "#DCE0E8"
    property color sliderFill: accent
    property color inputBackground: "#DCE0E8"
    property color inputBorder: border

    // =========================================================
    // NOTIFICATIONS
    // =========================================================

    property color notificationBackground: card
    property color notificationUnread: surfaceVariant

    // =========================================================
    // MEDIA
    // =========================================================

    property color progress: accent
    property color progressBackground: border

    // =========================================================
    // WALLPAPER SELECTOR
    // =========================================================

    property color wallpaperOverlay: overlayStrong
    property color wallpaperSelection: accent

    // =========================================================
    // POWER MENU
    // =========================================================

    property color powerDanger: danger
    property color powerWarning: warning

    // =========================================================
    // FONTS
    // =========================================================

    property string iconFont: "JetBrainsMono Nerd Font"
}