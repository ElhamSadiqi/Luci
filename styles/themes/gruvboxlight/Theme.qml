pragma Singleton

import QtQuick

// =========================================================
// GRUVBOX LIGHT
// =========================================================

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#FBF1C7"
    property color surface: "#F2E5BC"
    property color surfaceVariant: "#EBDBB2"
    property color card: "#EBDBB2"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlayLight: "#00000008"
    property color overlayMedium: "#00000018"
    property color overlayStrong: "#00000030"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#3C3836"
    property color textSecondary: "#665C54"
    property color textMuted: "#928374"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: "#665C54"
    property color iconActive: "#3C3836"
    property color iconDisabled: "#928374"

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#B57614"
    property color accentHover: "#D79921"
    property color accentPressed: "#9D6A10"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#D5C4A1"
    property color borderHover: "#BDAF91"
    property color borderSelected: accent
    property color borderSubtle: "#00000012"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#EBDBB2"
    property color buttonHover: "#E2CF9C"
    property color buttonPressed: "#D5C4A1"
    property color buttonSelected: accent
    property color buttonText: textPrimary
    property color controlButtonHover: "#E2CF9C"

    // =========================================================
    // DESTRUCTIVE ACTIONS
    // =========================================================

    property color danger: "#CC241D"
    property color dangerHover: "#B51D17"
    property color warning: "#D79921"
    property color success: "#98971A"

    // =========================================================
    // INPUTS / SLIDERS
    // =========================================================

    property color sliderBackground: "#EBDBB2"
    property color sliderFill: accent
    property color inputBackground: "#EBDBB2"
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