import QtQuick

QtObject {

    // Backgrounds
    property color background: "#282828"
    property color surface: "#32302F"
    property color card: "#3C3836"
    property color overlay: "#00000055"

    // Text
    property color textPrimary: "#EBDBB2"
    property color textSecondary: "#D5C4A1"
    property color textMuted: "#928374"

    // Icons
    property color icon: textSecondary
    property color iconActive: accent

    // Accent
    property color accent: "#D79921"
    property color accentHover: "#FABD2F"
    property color accentPressed: "#B57614"

    // Borders
    property color border: "#504945"
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
    property color powerDanger: "#FB4934"
    property color powerWarning: "#FABD2F"

    // Progress
    property color progress: accent
    property color progressBackground: border
}
