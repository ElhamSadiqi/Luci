import QtQuick

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#EFF1F5"
    property color surface: "#E6E9EF"
    property color card: "#DCE0E8"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlay: "#00000022"

    property color overlayLight: "#00000010"
    property color overlayMedium: "#00000022"
    property color overlayStrong: "#00000044"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#4C4F69"
    property color textSecondary: "#6C6F85"
    property color textMuted: "#8C8FA1"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: textSecondary
    property color iconActive: accent

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#1E66F5"
    property color accentHover: "#209FB5"
    property color accentPressed: "#1554D4"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#BCC0CC"
    property color borderSelected: accent
    property color borderSubtle: "#00000018"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: card
    property color buttonHover: "#D5D9E3"
    property color buttonSelected: accent
    property color buttonText: textPrimary

    // =========================================================
    // PREVIEW CARDS
    // =========================================================

    property color previewBackground: card
    property color previewText: textPrimary

    // =========================================================
    // WALLPAPER
    // =========================================================

    property color wallpaperOverlay: overlay
    property color wallpaperSelection: accent

    // =========================================================
    // POWER
    // =========================================================

    property color powerDanger: "#D20F39"
    property color powerWarning: "#DF8E1D"

    // =========================================================
    // PROGRESS
    // =========================================================

    property color progress: accent
    property color progressBackground: border
}
