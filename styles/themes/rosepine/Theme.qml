pragma Singleton

import QtQuick

// =========================================================
// ROSE PINE
// =========================================================

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#191724"
    property color surface: "#1F1D2E"
    property color surfaceVariant: "#26233A"
    property color card: "#26233A"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlayLight: "#FFFFFF08"
    property color overlayMedium: "#FFFFFF12"
    property color overlayStrong: "#00000088"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#E0DEF4"
    property color textSecondary: "#908CAA"
    property color textMuted: "#6E6A86"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: "#908CAA"
    property color iconActive: "#E0DEF4"
    property color iconDisabled: "#6E6A86"

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#C4A7E7"
    property color accentHover: "#D2B8F2"
    property color accentPressed: "#B692DA"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#403D52"
    property color borderHover: "#524F67"
    property color borderSelected: accent
    property color borderSubtle: "#FFFFFF14"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#26233A"
    property color buttonHover: "#312E45"
    property color buttonPressed: "#403D52"
    property color buttonSelected: accent
    property color buttonText: textPrimary
    property color controlButtonHover: "#312E45"

    // =========================================================
    // DESTRUCTIVE ACTIONS
    // =========================================================

    property color danger: "#EB6F92"
    property color dangerHover: "#D95E83"
    property color warning: "#F6C177"
    property color success: "#9CCFD8"

    // =========================================================
    // INPUTS / SLIDERS
    // =========================================================

    property color sliderBackground: "#26233A"
    property color sliderFill: accent
    property color inputBackground: "#26233A"
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
    property color progressBackground: "#403D52"

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