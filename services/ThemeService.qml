pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

import "../styles"

Singleton {

    id: root

    property string currentTheme: "monochrome"

    Process {
        id: process
    }

    property ListModel themes: ListModel {

        ListElement {

            themeId: "monochrome"

            name: "Monochrome"

            background: "#000000"

            color1: "#000000"
            color2: "#202020"
            color3: "#505050"

            accent: "#E5E7EB"

            text: "#E5E7EB"
        }

        ListElement {

            themeId: "catppuccin"

            name: "Catppuccin"

            background: "#24273A"

            color1: "#8AADF4"
            color2: "#A6DA95"
            color3: "#F5BDE6"

            accent: "#8AADF4"

            text: "#CAD3F5"
        }

        ListElement {

            themeId: "gruvbox"

            name: "Gruvbox"

            background: "#282828"

            color1: "#FABD2F"
            color2: "#B8BB26"
            color3: "#FE8019"

            accent: "#FABD2F"

            text: "#EBDBB2"
        }

        ListElement {

            themeId: "tokyonight"

            name: "Tokyo Night"

            background: "#1A1B26"

            color1: "#7AA2F7"
            color2: "#BB9AF7"
            color3: "#7DCFFF"

            accent: "#7AA2F7"

            text: "#C0CAF5"
        }


        ListElement {

            themeId: "dracula"

            name: "Dracula"

            background: "#282A36"

            color1: "#BD93F9"
            color2: "#FF79C6"
            color3: "#50FA7B"

            accent: "#BD93F9"

            text: "#F8F8F2"
        }


        ListElement {

            themeId: "nord"

            name: "Nord"

            background: "#2E3440"

            color1: "#88C0D0"
            color2: "#81A1C1"
            color3: "#A3BE8C"

            accent: "#88C0D0"

            text: "#D8DEE9"
        }


        ListElement {

            themeId: "everforest"

            name: "Everforest"

            background: "#2D353B"

            color1: "#A7C080"
            color2: "#E69875"
            color3: "#7FBBB3"

            accent: "#A7C080"

            text: "#D3C6AA"
        }


        ListElement {

            themeId: "solarized"

            name: "Solarized"

            background: "#002B36"

            color1: "#268BD2"
            color2: "#B58900"
            color3: "#2AA198"

            accent: "#268BD2"

            text: "#839496"
        }


        ListElement {

            themeId: "rosepine"

            name: "Rosé Pine"

            background: "#191724"

            color1: "#EBBCBA"
            color2: "#C4A7E7"
            color3: "#9CCFD8"

            accent: "#C4A7E7"

            text: "#E0DEF4"
        }


        ListElement {

            themeId: "gruvboxlight"

            name: "Gruvbox Light"

            background: "#FBF1C7"

            color1: "#D79921"
            color2: "#98971A"
            color3: "#D65D0E"

            accent: "#D79921"

            text: "#3C3836"
        }


        ListElement {

            themeId: "catppuccinlatte"

            name: "Catppuccin Latte"

            background: "#EFF1F5"

            color1: "#1E66F5"
            color2: "#40A02B"
            color3: "#EA76CB"

            accent: "#1E66F5"

            text: "#4C4F69"
        }


        ListElement {

            themeId: "githublight"

            name: "GitHub Light"

            background: "#FFFFFF"

            color1: "#0969DA"
            color2: "#1A7F37"
            color3: "#8250DF"

            accent: "#0969DA"

            text: "#24292F"
        }
    }
    
    function apply(themeName) {

        var component = Qt.createComponent(
            "../styles/themes/" + themeName + "/Theme.qml"
        )

        if (component.status !== Component.Ready) {

            console.log(
                "Theme load error:",
                component.errorString()
            )

            return
        }

        var theme = component.createObject()

        if (!theme) {

            console.log("Failed to create theme object.")

            return
        }

        applyTheme(theme)

        theme.destroy()

        currentTheme = themeName

        process.command = [
            "bash",
            Quickshell.env("HOME") + "/.config/quickshell/scripts/theme.sh",
            themeName
        ]

        process.running = true

        console.log("Applying theme:", themeName)
    }


    function applyTheme(themeObject) {

        Theme.background = themeObject.background
        Theme.surface = themeObject.surface
        Theme.card = themeObject.card
        Theme.overlay = themeObject.overlay

        Theme.textPrimary = themeObject.textPrimary
        Theme.textSecondary = themeObject.textSecondary
        Theme.textMuted = themeObject.textMuted

        Theme.icon = themeObject.icon
        Theme.iconActive = themeObject.iconActive

        Theme.accent = themeObject.accent
        Theme.accentHover = themeObject.accentHover
        Theme.accentPressed = themeObject.accentPressed

        Theme.border = themeObject.border
        Theme.borderSelected = themeObject.borderSelected

        Theme.buttonBackground = themeObject.buttonBackground
        Theme.buttonHover = themeObject.buttonHover
        Theme.buttonSelected = themeObject.buttonSelected
        Theme.buttonText = themeObject.buttonText

        Theme.wallpaperOverlay = themeObject.wallpaperOverlay
        Theme.wallpaperSelection = themeObject.wallpaperSelection

        Theme.powerDanger = themeObject.powerDanger
        Theme.powerWarning = themeObject.powerWarning

        Theme.progress = themeObject.progress
        Theme.progressBackground = themeObject.progressBackground

        console.log(
            "Theme loaded:",
            Theme.background,
            Theme.accent
        )
    }


    Component.onCompleted: {

        apply(currentTheme)

    }
}