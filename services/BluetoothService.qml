pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {

    id: root

    property bool enabled: false
    property bool connected: false

    property string deviceName: ""

    property string subtitle:
        connected
            ? deviceName
            : enabled
                ? "On"
                : "Off"

    property url icon: !enabled
        ? Qt.resolvedUrl("../assets/icons/bluetooth-off.svg")
        : connected
            ? Qt.resolvedUrl("../assets/icons/bluetooth-connected.svg")
            : Qt.resolvedUrl("../assets/icons/bluetooth.svg")

    Process {
        id: bluetoothState

        command: [
            "bluetoothctl",
            "show"
        ]

        stdout: StdioCollector {
            onStreamFinished: {

                let output = text

                root.enabled =
                    output.indexOf("Powered: yes") !== -1
            }
        }
    }

    Process {
        id: bluetoothDevices

        command: [
            "bluetoothctl",
            "devices",
            "Connected"
        ]

        stdout: StdioCollector {
            onStreamFinished: {

                let line = text.trim()

                if (line === "") {

                    root.connected = false
                    root.deviceName = ""

                } else {

                    root.connected = true

                    let parts = line.split(" ")

                    root.deviceName =
                        parts.slice(2).join(" ")
                }
            }
        }
    }

    Process {
        id: bluetoothToggle

        onExited: {
            root.update()
        }
    }

    Timer {

        interval: 5000

        running: true
        repeat: true

        onTriggered: update()
    }

    function update() {

        bluetoothState.running = false
        bluetoothDevices.running = false

        bluetoothState.running = true
        bluetoothDevices.running = true
    }

    function toggle() {

        bluetoothToggle.running = false

        if (enabled) {

            enabled = false

            bluetoothToggle.command = [
                "bluetoothctl",
                "power",
                "off"
            ]

        } else {

            enabled = true

            bluetoothToggle.command = [
                "bluetoothctl",
                "power",
                "on"
            ]
        }

        bluetoothToggle.running = true
    }

    Component.onCompleted: update()
}