import QtQuick

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#2B3339"
    property color surface: "#323C41"
    property color card: "#3A454A"

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

    property color textPrimary: "#D3C6AA"
    property color textSecondary: "#A7C080"
    property color textMuted: "#859289"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: textSecondary
    property color iconActive: accent

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#83C092"
    property color accentHover: "#A7C080"
    property color accentPressed: "#6FA37A"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#4F585E"
    property color borderSelected: accent
    property color borderSubtle: "#FFFFFF15"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: card
    property color buttonHover: "#445056"
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

    property color powerDanger: "#E67E80"
    property color powerWarning: "#DBBC7F"

    // =========================================================
    // PROGRESS
    // =========================================================

    property color progress: accent
    property color progressBackground: border
}
