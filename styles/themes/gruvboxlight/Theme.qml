import QtQuick

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#FBF1C7"
    property color surface: "#F2E5BC"
    property color card: "#EBDBB2"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlay: "#FFFFFF66"

    property color overlayLight: "#00000008"
    property color overlayMedium: "#00000018"
    property color overlayStrong: "#00000030"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#3C3836"
    property color textSecondary: "#665C54"
    property color textMuted: "#928374"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: textSecondary
    property color iconActive: accent

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#B57614"
    property color accentHover: "#D79921"
    property color accentPressed: "#9D6A10"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#D5C4A1"
    property color borderSelected: accent
    property color borderSubtle: "#00000012"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: card
    property color buttonHover: "#E2CF9C"
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

    property color powerDanger: "#CC241D"
    property color powerWarning: "#D79921"

    // =========================================================
    // PROGRESS
    // =========================================================

    property color progress: accent
    property color progressBackground: border
}
