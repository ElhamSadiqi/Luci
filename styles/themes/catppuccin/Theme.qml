pragma Singleton

import QtQuick

// =========================================================
// CATPPUCCIN
// =========================================================

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#24273A"
    property color surface: "#363A4F"
    property color surfaceVariant: "#494D64"
    property color card: "#494D64"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlayLight: "#00000022"
    property color overlayMedium: "#00000044"
    property color overlayStrong: "#00000066"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#CAD3F5"
    property color textSecondary: "#A5ADCB"
    property color textMuted: "#8087A2"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: "#A5ADCB"
    property color iconActive: "#CAD3F5"
    property color iconDisabled: "#8087A2"

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#8AADF4"
    property color accentHover: "#91D7E3"
    property color accentPressed: "#7DC4E4"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#5B6078"
    property color borderHover: "#6E738D"
    property color borderSelected: accent
    property color borderSubtle: "#00000020"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#494D64"
    property color buttonHover: "#363A4F"
    property color buttonPressed: "#5B6078"
    property color buttonSelected: accent
    property color buttonText: textPrimary
    property color controlButtonHover: "#5B6078"

    // =========================================================
    // DESTRUCTIVE ACTIONS
    // =========================================================

    property color danger: "#ED8796"
    property color dangerHover: "#E26D83"
    property color warning: "#EED49F"
    property color success: "#A6DA95"

    // =========================================================
    // INPUTS / SLIDERS
    // =========================================================

    property color sliderBackground: "#494D64"
    property color sliderFill: accent
    property color inputBackground: "#494D64"
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
    property color progressBackground: "#5B6078"

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