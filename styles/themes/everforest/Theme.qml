import QtQuick

QtObject {

    // Backgrounds
    property color background: "#2B3339"
    property color surface: "#323C41"
    property color card: "#3A454A"
    property color overlay: "#00000055"

    // Text
    property color textPrimary: "#D3C6AA"
    property color textSecondary: "#A7C080"
    property color textMuted: "#859289"

    // Icons
    property color icon: textSecondary
    property color iconActive: accent

    // Accent
    property color accent: "#83C092"
    property color accentHover: "#A7C080"
    property color accentPressed: "#6FA37A"

    // Borders
    property color border: "#4F585E"
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
    property color powerDanger: "#E67E80"
    property color powerWarning: "#DBBC7F"

    // Progress
    property color progress: accent
    property color progressBackground: border
}
