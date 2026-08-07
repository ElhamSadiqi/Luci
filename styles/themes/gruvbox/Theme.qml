pragma Singleton

import QtQuick

// =========================================================
// GRUVBOX
// =========================================================

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#282828"
    property color surface: "#32302F"
    property color surfaceVariant: "#3C3836"
    property color card: "#3C3836"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlayLight: "#FFFFFF08"
    property color overlayMedium: "#00000033"
    property color overlayStrong: "#00000066"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#EBDBB2"
    property color textSecondary: "#D5C4A1"
    property color textMuted: "#928374"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: "#D5C4A1"
    property color iconActive: "#EBDBB2"
    property color iconDisabled: "#928374"

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#D79921"
    property color accentHover: "#FABD2F"
    property color accentPressed: "#B57614"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#504945"
    property color borderHover: "#665C54"
    property color borderSelected: accent
    property color borderSubtle: "#FFFFFF15"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#3C3836"
    property color buttonHover: "#4A4642"
    property color buttonPressed: "#504945"
    property color buttonSelected: accent
    property color buttonText: textPrimary

    // Control Center
    property color controlButtonHover: "#504945"

    // =========================================================
    // DESTRUCTIVE ACTIONS
    // =========================================================

    property color danger: "#FB4934"
    property color dangerHover: "#CC241D"
    property color warning: "#FABD2F"
    property color success: "#B8BB26"

    // =========================================================
    // INPUTS / SLIDERS
    // =========================================================

    property color sliderBackground: "#3C3836"
    property color sliderFill: accent
    property color inputBackground: "#3C3836"
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
    property color progressBackground: "#504945"

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