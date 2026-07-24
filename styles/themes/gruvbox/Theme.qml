import QtQuick

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#282828"
    property color surface: "#32302F"
    property color card: "#3C3836"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlay: "#00000055"

    property color overlayLight: "#FFFFFF08"
    property color overlayMedium: "#00000033"
    property color overlayStrong: "#00000066"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#EBDBB2"
    property color textSecondary: "#D5C4A1"
    property color textMuted: "#928374"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: textSecondary
    property color iconActive: accent

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#D79921"
    property color accentHover: "#FABD2F"
    property color accentPressed: "#B57614"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#504945"
    property color borderSelected: accent
    property color borderSubtle: "#FFFFFF15"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: card
    property color buttonHover: "#4A4642"
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

    property color powerDanger: "#FB4934"
    property color powerWarning: "#FABD2F"

    // =========================================================
    // PROGRESS
    // =========================================================

    property color progress: accent
    property color progressBackground: border
}
