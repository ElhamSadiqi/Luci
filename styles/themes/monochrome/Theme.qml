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

    property color overlayLight: "#FFFFFF08"
    property color overlayMedium: "#FFFFFF12"
    property color overlayStrong: "#00000088"

    // =========================================================
    // TEXT
    // =========================================================

    property color textPrimary: "#E5E7EB"
    property color textSecondary: "#9CA3AF"
    property color textMuted: "#6B7280"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: textSecondary
    property color iconActive: accent

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
    property color borderSubtle: "#FFFFFF14"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: card
    property color buttonHover: "#2A2A2A"
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

    property color powerDanger: "#EF4444"
    property color powerWarning: "#F59E0B"

    // =========================================================
    // PROGRESS
    // =========================================================

    property color progress: accent
    property color progressBackground: border
}
