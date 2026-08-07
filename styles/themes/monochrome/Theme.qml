pragma Singleton

import QtQuick

// =========================================================
// MONOCHROME
// =========================================================

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#000000"
    property color surface: "#1A1A1A"
    property color surfaceVariant: "#303030"
    property color card: "#202020"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlayLight: "#00000022"
    property color overlayMedium: "#00000044"
    property color overlayStrong: "#00000066"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#E5E7EB"
    property color textSecondary: "#9CA3AF"
    property color textMuted: "#6B7280"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: "#9CA3AF"
    property color iconActive: "#E5E7EB"
    property color iconDisabled: "#6B7280"

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#E5E7EB"
    property color accentHover: "#F3F4F6"
    property color accentPressed: "#D1D5DB"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#404040"
    property color borderHover: "#606060"
    property color borderSelected: accent
    property color borderSubtle: "#00000020"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#202020"
    property color buttonHover: "#2A2A2A"
    property color buttonPressed: "#404040"
    property color buttonSelected: accent
    property color buttonText: textPrimary
    property color controlButtonHover: "#404040"

    // =========================================================
    // DESTRUCTIVE ACTIONS
    // =========================================================

    property color danger: "#EF4444"
    property color dangerHover: "#DC2626"
    property color warning: "#F59E0B"
    property color success: "#22C55E"

    // =========================================================
    // INPUTS / SLIDERS
    // =========================================================

    property color sliderBackground: "#303030"
    property color sliderFill: accent
    property color inputBackground: "#202020"
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
    property color progressBackground: "#404040"

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