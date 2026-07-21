import QtQuick

QtObject {

    // Backgrounds
    property color background: "#FFFFFF"
    property color surface: "#F6F8FA"
    property color card: "#EEF2F6"
    property color overlay: "#FFFFFF66"

    // Text
    property color textPrimary: "#24292F"
    property color textSecondary: "#57606A"
    property color textMuted: "#6E7781"

    // Icons
    property color icon: textSecondary
    property color iconActive: accent

    // Accent
    property color accent: "#0969DA"
    property color accentHover: "#218BFF"
    property color accentPressed: "#0550AE"

    // Borders
    property color border: "#D0D7DE"
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
    property color powerDanger: "#CF222E"
    property color powerWarning: "#BF8700"

    // Progress
    property color progress: accent
    property color progressBackground: border
}
