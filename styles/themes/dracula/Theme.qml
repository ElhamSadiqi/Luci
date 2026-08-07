pragma Singleton

import QtQuick

// =========================================================
// DRACULA
// =========================================================

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#282A36"
    property color surface: "#343746"
    property color surfaceVariant: "#44475A"
    property color card: "#44475A"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlayLight: "#FFFFFF08"
    property color overlayMedium: "#00000033"
    property color overlayStrong: "#00000066"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#F8F8F2"
    property color textSecondary: "#BFBFBF"
    property color textMuted: "#8A8A8A"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: "#BFBFBF"
    property color iconActive: "#F8F8F2"
    property color iconDisabled: "#8A8A8A"

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#BD93F9"
    property color accentHover: "#D6ACFF"
    property color accentPressed: "#A57EEB"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#6272A4"
    property color borderHover: "#7585B8"
    property color borderSelected: accent
    property color borderSubtle: "#FFFFFF18"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#44475A"
    property color buttonHover: "#50546B"
    property color buttonPressed: "#6272A4"
    property color buttonSelected: accent
    property color buttonText: textPrimary
    property color controlButtonHover: "#50546B"

    // =========================================================
    // DESTRUCTIVE ACTIONS
    // =========================================================

    property color danger: "#FF5555"
    property color dangerHover: "#E64545"
    property color warning: "#F1FA8C"
    property color success: "#50FA7B"

    // =========================================================
    // INPUTS / SLIDERS
    // =========================================================

    property color sliderBackground: "#44475A"
    property color sliderFill: accent
    property color inputBackground: "#44475A"
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
    property color progressBackground: "#6272A4"

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