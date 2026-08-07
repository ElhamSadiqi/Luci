pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {

    id: root

    property int brightness: 0

    readonly property url brightnessIcon: {

        if (brightness <= 25)
            return "../assets/icons/brightness-down.svg"

        if (brightness <= 65)
            return "../assets/icons/brightness-half.svg"

        return "../assets/icons/brightness-full.svg"
    }

    Process {
        id: queryProcess

        command: [
            "brightnessctl",
            "info"
        ]

        stdout: StdioCollector {

            onStreamFinished: {

                let output = this.text.trim()

                let match = output.match(/\((\d+)%\)/)

                if (match)
                    root.brightness = parseInt(match[1])
            }
        }
    }

    Process {
        id: setProcess

        onExited: {
            root.update()
        }
    }

    function update() {

        queryProcess.running = false
        queryProcess.running = true
    }

    function setBrightness(value) {

        let percent = Math.round(value)

        let scriptPath =
            String(
                Qt.resolvedUrl("../scripts/brightness.sh")
            ).replace("file://", "")

        setProcess.command = [
            scriptPath,
            percent + "%"
        ]

        setProcess.running = true
    }

    function increase(step) {

        let amount = step === undefined ? 5 : step

        setBrightness(
            Math.min(100, brightness + amount)
        )
    }

    function decrease(step) {

        let amount = step === undefined ? 5 : step

        setBrightness(
            Math.max(0, brightness - amount)
        )
    }

    Component.onCompleted: {
        update()
    }
}