import QtQuick

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#24283B"
    property color surface: "#2F3549"
    property color card: "#3B4261"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlay: "#00000055"

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

    property color icon: textSecondary
    property color iconActive: accent

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
    property color borderSelected: accent
    property color borderSubtle: "#FFFFFF14"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: card
    property color buttonHover: "#48517A"
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

    property color powerDanger: "#F7768E"
    property color powerWarning: "#E0AF68"

    // =========================================================
    // PROGRESS
    // =========================================================

    property color progress: accent
    property color progressBackground: border
}
