import QtQuick

QtObject {

    // Backgrounds
    property color background: "#000000"
    property color surface: "#1A1A1A"
    property color card: "#202020"
    property color overlay: "#00000066"

    // Text
    property color textPrimary: "#E5E7EB"
    property color textSecondary: "#9CA3AF"
    property color textMuted: "#6B7280"

    // Icons
    property color icon: textSecondary
    property color iconActive: accent

    // Accent
    property color accent: "#E5E7EB"
    property color accentHover: "#F3F4F6"
    property color accentPressed: "#D1D5DB"

    // Borders
    property color border: "#404040"
    property color borderSelected: accent

    // Buttons
    property color buttonBackground: card
    property color buttonHover: "#2A2A2A"
    property color buttonSelected: accent
    property color buttonText: textPrimary

    // Wallpaper
    property color wallpaperOverlay: overlay
    property color wallpaperSelection: accent

    // Power Menu
    property color powerDanger: "#EF4444"
    property color powerWarning: "#F59E0B"

    // Progress
    property color progress: accent
    property color progressBackground: border
}
