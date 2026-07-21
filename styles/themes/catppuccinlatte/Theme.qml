import QtQuick

QtObject {

    // Backgrounds
    property color background: "#EFF1F5"
    property color surface: "#E6E9EF"
    property color card: "#DCE0E8"
    property color overlay: "#FFFFFF66"

    // Text
    property color textPrimary: "#4C4F69"
    property color textSecondary: "#6C6F85"
    property color textMuted: "#8C8FA1"

    // Icons
    property color icon: textSecondary
    property color iconActive: accent

    // Accent
    property color accent: "#1E66F5"
    property color accentHover: "#209FB5"
    property color accentPressed: "#1554D4"

    // Borders
    property color border: "#BCC0CC"
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
    property color powerDanger: "#D20F39"
    property color powerWarning: "#DF8E1D"

    // Progress
    property color progress: accent
    property color progressBackground: border
}
