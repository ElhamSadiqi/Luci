import QtQuick

QtObject {

    // Backgrounds
    property color background: "#191724"
    property color surface: "#1F1D2E"
    property color card: "#26233A"
    property color overlay: "#00000066"

    // Text
    property color textPrimary: "#E0DEF4"
    property color textSecondary: "#908CAA"
    property color textMuted: "#6E6A86"

    // Icons
    property color icon: textSecondary
    property color iconActive: accent

    // Accent
    property color accent: "#C4A7E7"
    property color accentHover: "#D2B8F2"
    property color accentPressed: "#B692DA"

    // Borders
    property color border: "#403D52"
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
    property color powerDanger: "#EB6F92"
    property color powerWarning: "#F6C177"

    // Progress
    property color progress: accent
    property color progressBackground: border
}
