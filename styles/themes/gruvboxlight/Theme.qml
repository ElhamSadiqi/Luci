import QtQuick

QtObject {

    // Backgrounds
    property color background: "#FBF1C7"
    property color surface: "#F2E5BC"
    property color card: "#EBDBB2"
    property color overlay: "#FFFFFF66"

    // Text
    property color textPrimary: "#3C3836"
    property color textSecondary: "#665C54"
    property color textMuted: "#928374"

    // Icons
    property color icon: textSecondary
    property color iconActive: accent

    // Accent
    property color accent: "#B57614"
    property color accentHover: "#D79921"
    property color accentPressed: "#9D6A10"

    // Borders
    property color border: "#D5C4A1"
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
    property color powerDanger: "#CC241D"
    property color powerWarning: "#D79921"

    // Progress
    property color progress: accent
    property color progressBackground: border
}
