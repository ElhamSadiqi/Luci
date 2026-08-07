pragma Singleton

import QtQuick

// =========================================================
// EVERFOREST
// =========================================================

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#2B3339"
    property color surface: "#323C41"
    property color surfaceVariant: "#3A454A"
    property color card: "#3A454A"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlayLight: "#FFFFFF08"
    property color overlayMedium: "#00000033"
    property color overlayStrong: "#00000066"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#D3C6AA"
    property color textSecondary: "#A7C080"
    property color textMuted: "#859289"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: "#A7C080"
    property color iconActive: "#D3C6AA"
    property color iconDisabled: "#859289"

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#83C092"
    property color accentHover: "#A7C080"
    property color accentPressed: "#6FA37A"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#4F585E"
    property color borderHover: "#626C73"
    property color borderSelected: accent
    property color borderSubtle: "#FFFFFF15"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#3A454A"
    property color buttonHover: "#445056"
    property color buttonPressed: "#4F585E"
    property color buttonSelected: accent
    property color buttonText: textPrimary
    property color controlButtonHover: "#445056"

    // =========================================================
    // DESTRUCTIVE ACTIONS
    // =========================================================

    property color danger: "#E67E80"
    property color dangerHover: "#D46F72"
    property color warning: "#DBBC7F"
    property color success: "#A7C080"

    // =========================================================
    // INPUTS / SLIDERS
    // =========================================================

    property color sliderBackground: "#3A454A"
    property color sliderFill: accent
    property color inputBackground: "#3A454A"
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
    property color progressBackground: "#4F585E"

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