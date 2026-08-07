pragma Singleton

import QtQuick

// =========================================================
// TOKYO NIGHT
// =========================================================

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#24283B"
    property color surface: "#2F3549"
    property color surfaceVariant: "#3B4261"
    property color card: "#3B4261"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlayLight: "#FFFFFF08"
    property color overlayMedium: "#FFFFFF12"
    property color overlayStrong: "#00000066"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#C0CAF5"
    property color textSecondary: "#A9B1D6"
    property color textMuted: "#7A82A7"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: "#A9B1D6"
    property color iconActive: "#C0CAF5"
    property color iconDisabled: "#7A82A7"

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#7AA2F7"
    property color accentHover: "#89B4FA"
    property color accentPressed: "#6B8EE6"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#565F89"
    property color borderHover: "#6B749C"
    property color borderSelected: accent
    property color borderSubtle: "#FFFFFF14"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#3B4261"
    property color buttonHover: "#48517A"
    property color buttonPressed: "#565F89"
    property color buttonSelected: accent
    property color buttonText: textPrimary
    property color controlButtonHover: "#48517A"

    // =========================================================
    // DESTRUCTIVE ACTIONS
    // =========================================================

    property color danger: "#F7768E"
    property color dangerHover: "#E05F79"
    property color warning: "#E0AF68"
    property color success: "#9ECE6A"

    // =========================================================
    // INPUTS / SLIDERS
    // =========================================================

    property color sliderBackground: "#3B4261"
    property color sliderFill: accent
    property color inputBackground: "#3B4261"
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
    property color progressBackground: "#565F89"

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