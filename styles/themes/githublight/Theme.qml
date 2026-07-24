import QtQuick

QtObject {

    // =========================================================
    // BACKGROUNDS
    // =========================================================

    property color background: "#FFFFFF"
    property color surface: "#F6F8FA"
    property color card: "#EEF2F6"

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

    property color textPrimary: "#24292F"
    property color textSecondary: "#57606A"
    property color textMuted: "#6E7781"

    // =========================================================
    // ICONS
    // =========================================================

    property color icon: textSecondary
    property color iconActive: accent

    // =========================================================
    // ACCENT
    // =========================================================

    property color accent: "#0969DA"
    property color accentHover: "#218BFF"
    property color accentPressed: "#0550AE"

    // =========================================================
    // BORDERS
    // =========================================================

    property color border: "#D0D7DE"
    property color borderSelected: accent
    property color borderSubtle: "#00000012"

    // =========================================================
    // BUTTONS
    // =========================================================

    property color buttonBackground: card
    property color buttonHover: "#E2E8F0"
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

    property color powerDanger: "#CF222E"
    property color powerWarning: "#BF8700"

    // =========================================================
    // PROGRESS
    // =========================================================

    property color progress: accent
    property color progressBackground: border
}
