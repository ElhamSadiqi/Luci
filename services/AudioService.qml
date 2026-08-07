pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {

    id: root

    property int volume: 0
    property bool muted: false

    readonly property url volumeIcon: {

        if (muted)
            return "../assets/icons/volume-off.svg"

        if (volume <= 5)
            return "../assets/icons/volume-0.svg"

        if (volume <= 40)
            return "../assets/icons/volume-1.svg"

        return "../assets/icons/volume-2.svg"
    }

    Process {
        id: queryProcess

        command: [
            "sh",
            "-c",
            "wpctl get-volume @DEFAULT_AUDIO_SINK@"
        ]

        stdout: StdioCollector {

            onStreamFinished: {

                let output = this.text.trim()

                if (output.length === 0)
                    return

                let parts = output.split(" ")

                let value = parseFloat(parts[1])

                if (!isNaN(value))
                    root.volume = Math.round(value * 100)

                root.muted =
                    output.includes("[MUTED]")
            }
        }
    }

    Process {
        id: setProcess
    }

    function update() {

        queryProcess.running = false
        queryProcess.running = true
    }

    function setVolume(value) {

        let percent = Math.round(value)

        setProcess.command = [
            "wpctl",
            "set-volume",
            "@DEFAULT_AUDIO_SINK@",
            percent + "%"
        ]

        setProcess.running = true
    }

    function toggleMute() {

        setProcess.command = [
            "wpctl",
            "set-mute",
            "@DEFAULT_AUDIO_SINK@",
            "toggle"
        ]

        setProcess.running = true
    }

    Timer {

        interval: 1000
        repeat: true
        running: true

        onTriggered: {
            root.update()
        }
    }

    Component.onCompleted: {
        update()
    }
}
