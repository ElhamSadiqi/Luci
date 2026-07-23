import QtQuick
import Quickshell
import Quickshell.Io

Item {
    id: root

    property int percentage: 0
    property bool charging: false
    property bool pluggedIn: false
    property string status: ""
    property string icon: "󰁺"

    Process {
        id: batteryReader

        running: true

        command: [
            "bash",
            "-c",
            "cat /sys/class/power_supply/BAT1/capacity && cat /sys/class/power_supply/BAT1/status && cat /sys/class/power_supply/ADP1/online"
        ]

        stdout: StdioCollector {

            onStreamFinished: {

                let lines = text.trim().split("\n")

                if (lines.length < 3)
                    return

                root.percentage = Number(lines[0])

                root.status = lines[1]

                root.pluggedIn = lines[2] === "1"

                root.charging =
                    root.status === "Charging"

                updateIcon()

                console.log(
                    "Battery:",
                    root.percentage,
                    root.status,
                    "AC:",
                    root.pluggedIn,
                    root.icon
                )
            }
        }
    }

    Timer {

        interval: 5000

        running: true

        repeat: true


        onTriggered: {

            batteryReader.running = false
            batteryReader.running = true

        }
    }

    function updateIcon() {

        if (pluggedIn) {

            icon = "󰂄"

            return
        }

        if (percentage >= 95) {

            icon = "󰁹"

        } else if (percentage >= 75) {

            icon = "󰂀"

        } else if (percentage >= 50) {

            icon = "󰁿"

        } else if (percentage >= 25) {

            icon = "󰁾"

        } else if (percentage >= 10) {

            icon = "󰁼"

        } else {

            icon = "󰁺"
        }
    }
}