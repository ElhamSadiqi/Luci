import QtQuick

QtObject {

    // Backgrounds
    property color background: "#24202A"
    property color surface: "#2A2F45"
    property color card: "#32344A"
    property color overlay: "#00000055"

    // Text
    property color textPrimary: "#A6B0D4"
    property color textSecondary: "#7F85A3"
    property color textMuted: "#5C637A"

    // Icons
    property color icon: textSecondary
    property color iconActive: accent

    // Accent
    property color accent: "#7FA2E4"
    property color accentHover: "#9BBCF0"
    property color accentPressed: "#6F8FD1"

    // Borders
    property color border: "#4B5263"
    property color borderSelected: accent

    // Buttons
    property color buttonBackground: card
    property color buttonHover: surface
    property color buttonSelected: accent
    property color buttonText: textPrimary

    // Wallpaper
    property color wallpaperOverlay: overlay
    property color wallpaperSelection: accent

    // Power Menu
    property color powerDanger: "#FF4841"
    property color powerWarning: "#FEFE9B"

    // Progress
    property color progress: accent
    property color progressBackground: border
}
