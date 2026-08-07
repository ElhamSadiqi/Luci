pragma Singleton

import QtQuick

// =========================================================
// NORD
// =========================================================

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#2E3440"
    property color surface: "#3B4252"
    property color surfaceVariant: "#434C5E"
    property color card: "#434C5E"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlayLight: "#FFFFFF08"
    property color overlayMedium: "#FFFFFF12"
    property color overlayStrong: "#00000066"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#ECEFF4"
    property color textSecondary: "#D8DEE9"
    property color textMuted: "#81A1C1"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: "#D8DEE9"
    property color iconActive: "#ECEFF4"
    property color iconDisabled: "#81A1C1"

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#88C0D0"
    property color accentHover: "#8FBCBB"
    property color accentPressed: "#5E81AC"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#4C566A"
    property color borderHover: "#5E6A80"
    property color borderSelected: accent
    property color borderSubtle: "#FFFFFF15"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#434C5E"
    property color buttonHover: "#4E596D"
    property color buttonPressed: "#5E6A80"
    property color buttonSelected: accent
    property color buttonText: textPrimary
    property color controlButtonHover: "#4E596D"

    // =========================================================
    // DESTRUCTIVE ACTIONS
    // =========================================================

    property color danger: "#BF616A"
    property color dangerHover: "#A84F58"
    property color warning: "#EBCB8B"
    property color success: "#A3BE8C"

    // =========================================================
    // INPUTS / SLIDERS
    // =========================================================

    property color sliderBackground: "#434C5E"
    property color sliderFill: accent
    property color inputBackground: "#434C5E"
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
    property color progressBackground: "#4C566A"

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