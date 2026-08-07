pragma Singleton

import QtQuick

// =========================================================
// GITHUB LIGHT
// =========================================================

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#FFFFFF"
    property color surface: "#F6F8FA"
    property color surfaceVariant: "#EEF2F6"
    property color card: "#EEF2F6"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlayLight: "#00000008"
    property color overlayMedium: "#00000018"
    property color overlayStrong: "#00000030"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#24292F"
    property color textSecondary: "#57606A"
    property color textMuted: "#6E7781"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: "#57606A"
    property color iconActive: "#0969DA"
    property color iconDisabled: "#8C959F"

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#0969DA"
    property color accentHover: "#218BFF"
    property color accentPressed: "#0550AE"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#D0D7DE"
    property color borderHover: "#8C959F"
    property color borderSelected: accent
    property color borderSubtle: "#00000012"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#EEF2F6"
    property color buttonHover: "#D8DEE4"
    property color buttonPressed: "#BCC6D0"
    property color buttonSelected: accent
    property color buttonText: textPrimary
    property color controlButtonHover: "#D8DEE4"

    // =========================================================
    // DESTRUCTIVE ACTIONS
    // =========================================================

    property color danger: "#CF222E"
    property color dangerHover: "#A40E26"
    property color warning: "#BF8700"
    property color success: "#1A7F37"

    // =========================================================
    // INPUTS / SLIDERS
    // =========================================================

    property color sliderBackground: "#D8DEE4"
    property color sliderFill: accent
    property color inputBackground: "#FFFFFF"
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