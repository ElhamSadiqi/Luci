pragma Singleton

import QtQuick

// =========================================================
// SOLARIZED
// =========================================================

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#002B36"
    property color surface: "#073642"
    property color surfaceVariant: "#0B3B49"
    property color card: "#0B3B49"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlayLight: "#FFFFFF08"
    property color overlayMedium: "#FFFFFF12"
    property color overlayStrong: "#00000066"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#EEE8D5"
    property color textSecondary: "#93A1A1"
    property color textMuted: "#657B83"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: "#93A1A1"
    property color iconActive: "#EEE8D5"
    property color iconDisabled: "#657B83"

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#268BD2"
    property color accentHover: "#2AA198"
    property color accentPressed: "#1E6FA8"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#586E75"
    property color borderHover: "#6D848B"
    property color borderSelected: accent
    property color borderSubtle: "#FFFFFF14"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#0B3B49"
    property color buttonHover: "#14505E"
    property color buttonPressed: "#586E75"
    property color buttonSelected: accent
    property color buttonText: textPrimary
    property color controlButtonHover: "#14505E"

    // =========================================================
    // DESTRUCTIVE ACTIONS
    // =========================================================

    property color danger: "#DC322F"
    property color dangerHover: "#C72C29"
    property color warning: "#B58900"
    property color success: "#859900"

    // =========================================================
    // INPUTS / SLIDERS
    // =========================================================

    property color sliderBackground: "#0B3B49"
    property color sliderFill: accent
    property color inputBackground: "#0B3B49"
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
    property color progressBackground: "#586E75"

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