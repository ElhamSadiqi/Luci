pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property bool enabled: false

    property string subtitle: enabled ? "On" : "Off"

    property url icon: enabled
        ? Qt.resolvedUrl("../assets/icons/moon-stars.svg")
        : Qt.resolvedUrl("../assets/icons/moon.svg")

    Process {
        id: stateProcess

        command: [
            "bash",
            "-c",
            "pgrep -x hyprsunset >/dev/null && echo on || echo off"
        ]

        stdout: StdioCollector {
            onStreamFinished: {
                root.enabled = text.trim() === "on"
            }
        }
    }

    Process {
        id: toggleProcess

        onExited: {
            root.update()
        }
    }

    Timer {
        interval: 3000
        running: true
        repeat: true

        onTriggered: root.update()
    }

    function update() {
        stateProcess.running = false
        stateProcess.running = true
    }

    function toggle() {

        toggleProcess.running = false

        if (enabled) {

            enabled = false

            toggleProcess.command = [
                "pkill",
                "hyprsunset"
            ]

        } else {

            enabled = true

            toggleProcess.command = [
                "hyprsunset",
                "--temperature",
                "4500"
            ]
        }

        toggleProcess.running = true
    }

    Component.onCompleted: update()
}