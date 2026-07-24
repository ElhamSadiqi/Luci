import QtQuick

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#191724"
    property color surface: "#1F1D2E"
    property color card: "#26233A"

    // =========================================================
    // OVERLAYS
    // =========================================================

    property color overlay: "#00000066"

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

    property color icon: textSecondary
    property color iconActive: accent

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
    property color borderSelected: accent
    property color borderSubtle: "#FFFFFF14"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: card
    property color buttonHover: "#312E45"
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

    property color powerDanger: "#EB6F92"
    property color powerWarning: "#F6C177"

    // =========================================================
    // PROGRESS
    // =========================================================

    property color progress: accent
    property color progressBackground: border
}
