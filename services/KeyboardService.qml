import QtQuick
import Quickshell
import Quickshell.Io

import "../managers"

Item {
    id: root

    property string layout: "EN"
    property string fullName: "English"
    property string icon: "󰌌"

    property string lastLayout: ""

    Process {
        id: layoutReader

        running: true

        command: [
            "bash",
            "-c",
            "hyprctl -j devices | jq -r '.keyboards[] | select(.main == true) | .active_keymap'"
        ]

        stdout: StdioCollector {

            onStreamFinished: {

                let keymap = text.trim()

                let newLayout = "EN"
                let newName = "English"

                if (keymap.startsWith("English")) {

                    newLayout = "EN"
                    newName = "English"

                } else if (
                    keymap.startsWith("Persian") ||
                    keymap.startsWith("Iranian")
                ) {

                    newLayout = "FA"
                    newName = "Persian"

                } else {

                    newLayout = keymap.substring(0, 2).toUpperCase()
                    newName = keymap
                }

                if (root.lastLayout === "") {
                    root.lastLayout = newLayout
                    root.layout = newLayout
                    root.fullName = newName

                    console.log(
                        "Keyboard:",
                        root.layout,
                        root.fullName
                    )

                    return
                }

                // Nothing changed.
                if (newLayout === root.lastLayout)
                    return

                root.lastLayout = newLayout

                root.layout = newLayout
                root.fullName = newName

                StatusManager.show({
                    mode: "keyboard",
                    icon: root.icon,
                    title: root.fullName,
                    value: root.layout,

                    statusWidth: 220,
                    statusHeight: 33
                })

                console.log(
                    "Keyboard:",
                    root.layout,
                    root.fullName
                )
            }
        }
    }

    Timer {

        interval: 300

        running: true

        repeat: true

        onTriggered: {

            layoutReader.running = false
            layoutReader.running = true
        }
    }
}