import QtQuick

QtObject {

    // Backgrounds
    property color background: "#002B36"
    property color surface: "#073642"
    property color card: "#0B3B49"
    property color overlay: "#00000055"

    // Text
    property color textPrimary: "#EEE8D5"
    property color textSecondary: "#93A1A1"
    property color textMuted: "#657B83"

    // Icons
    property color icon: textSecondary
    property color iconActive: accent

    // Accent
    property color accent: "#268BD2"
    property color accentHover: "#2AA198"
    property color accentPressed: "#1E6FA8"

    // Borders
    property color border: "#586E75"
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
    property color powerDanger: "#DC322F"
    property color powerWarning: "#B58900"

    // Progress
    property color progress: accent
    property color progressBackground: border
}
