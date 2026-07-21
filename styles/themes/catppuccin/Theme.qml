import QtQuick

QtObject {

    // Backgrounds
    property color background: "#24273A"
    property color surface: "#363A4F"
    property color card: "#494D64"
    property color overlay: "#00000055"

    // Text
    property color textPrimary: "#CAD3F5"
    property color textSecondary: "#A5ADCB"
    property color textMuted: "#8087A2"

    // Icons
    property color icon: textSecondary
    property color iconActive: accent

    // Accent
    property color accent: "#8AADF4"
    property color accentHover: "#91D7E3"
    property color accentPressed: "#7DC4E4"

    // Borders
    property color border: "#5B6078"
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
    property color powerDanger: "#ED8796"
    property color powerWarning: "#EED49F"

    // Progress
    property color progress: accent
    property color progressBackground: border
}
