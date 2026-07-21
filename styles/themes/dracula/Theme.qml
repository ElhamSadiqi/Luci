import QtQuick

QtObject {

    // Backgrounds
    property color background: "#282A36"
    property color surface: "#343746"
    property color card: "#44475A"
    property color overlay: "#00000055"

    // Text
    property color textPrimary: "#F8F8F2"
    property color textSecondary: "#BFBFBF"
    property color textMuted: "#8A8A8A"

    // Icons
    property color icon: textSecondary
    property color iconActive: accent

    // Accent
    property color accent: "#BD93F9"
    property color accentHover: "#D6ACFF"
    property color accentPressed: "#A57EEB"

    // Borders
    property color border: "#6272A4"
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
    property color powerDanger: "#FF5555"
    property color powerWarning: "#F1FA8C"

    // Progress
    property color progress: accent
    property color progressBackground: border
}
