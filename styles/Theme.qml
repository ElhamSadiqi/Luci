pragma Singleton

import QtQuick

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#000000"
    property color surface: "#1A1A1A"
    property color card: "#202020"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlay: "#00000066"

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
    property color borderSelected: accent
    property color borderSubtle: "#00000020"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: "#202020"
    property color buttonHover: "#2A2A2A"
    property color buttonSelected: accent
    property color buttonText: textPrimary

    // =========================================================
    // PREVIEW CARDS
    // =========================================================

    property color previewBackground: card
    property color previewText: textPrimary

    // =========================================================
    // WALLPAPER SELECTOR
    // =========================================================

    property color wallpaperOverlay: overlayStrong
    property color wallpaperSelection: accent

    // =========================================================
    // POWER MENU
    // =========================================================

    property color powerDanger: "#EF4444"
    property color powerWarning: "#F59E0B"

    // =========================================================
    // MEDIA
    // =========================================================

    property color progress: accent
    property color progressBackground: "#404040"

    // =========================================================
    // FONTS
    // =========================================================

    property string iconFont: "JetBrainsMono Nerd Font"

    // =========================================================
    // LAYOUT (NOT THEME DEPENDENT)
    // =========================================================

    readonly property int clockSpacing: 2

    readonly property int capsuleRadius: 23

    readonly property int leftSectionWidth: 130
    readonly property int rightSectionWidth: 90

    readonly property int outerPadding: 16

    readonly property int capsulePadding: 14
    readonly property int sectionGap: 0

    // =========================================================
    // ANIMATION
    // =========================================================

    readonly property int animationFast: 180
    readonly property int animationNormal: 220
    readonly property int animationSlow: 500
}