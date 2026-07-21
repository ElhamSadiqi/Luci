import QtQuick

QtObject {

    // Backgrounds
    property color background: "#2E3440"
    property color surface: "#3B4252"
    property color card: "#434C5E"
    property color overlay: "#00000055"

    // Text
    property color textPrimary: "#ECEFF4"
    property color textSecondary: "#D8DEE9"
    property color textMuted: "#81A1C1"

    // Icons
    property color icon: textSecondary
    property color iconActive: accent

    // Accent
    property color accent: "#88C0D0"
    property color accentHover: "#8FBCBB"
    property color accentPressed: "#5E81AC"

    // Borders
    property color border: "#4C566A"
    property color borderSelected: accent

    // Buttons
    property color buttonBackground: card
    property color buttonHover: surface
    property color buttonSelected: accent
    property color buttonText: textPrimary

    // Wallpaper
    property color wallpaperOverlay: overlay
    property color wallpaperSelection: accent

    // Power
    property color powerDanger: "#BF616A"
    property color powerWarning: "#EBCB8B"

    // Progress
    property color progress: accent
    property color progressBackground: border
}
