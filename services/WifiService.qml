pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property bool connected: false
    property bool connecting: false

    property int strength: 0
    property string ssid: ""

    property string icon: "󰤮"

    property string subtitle:
        connected
            ? ssid
            : (connecting
                ? "Connecting..."
                : "Disconnected")

    property url svgIcon: !connected
        ? Qt.resolvedUrl("../assets/icons/wifi-off.svg")
        : Qt.resolvedUrl("../assets/icons/wifi.svg")

    Process {
        id: wifiReader

        command: [
            "bash",
            "-c",
            "nmcli -t -f ACTIVE,SIGNAL,SSID dev wifi | grep '^yes:'"
        ]

        stdout: StdioCollector {
            onStreamFinished: {

                let line = text.trim()

                if (line === "") {

                    root.connected = false
                    root.strength = 0
                    root.ssid = ""

                    if (!root.connecting)
                        root.connecting = false

                    updateIcon()

                    return
                }

                let parts = line.split(":")

                root.connected = true
                root.connecting = false

                root.strength = Number(parts[1])
                root.ssid = parts.slice(2).join(":")

                updateIcon()
            }
        }
    }

    Process {
        id: wifiToggle

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

        wifiReader.running = false
        wifiReader.running = true
    }

    function toggle() {

        wifiToggle.running = false

        if (connected) {

            connected = false
            connecting = false

            strength = 0
            ssid = ""

            wifiToggle.command = [
                "nmcli",
                "radio",
                "wifi",
                "off"
            ]

        } else {

            connected = false
            connecting = true

            strength = 0
            ssid = ""

            wifiToggle.command = [
                "nmcli",
                "radio",
                "wifi",
                "on"
            ]
        }

        updateIcon()

        wifiToggle.running = true
    }

    function updateIcon() {

        if (!connected) {

            icon = "󰤮"
            return
        }

        if (strength >= 80)
            icon = "󰤨"
        else if (strength >= 60)
            icon = "󰤥"
        else if (strength >= 40)
            icon = "󰤢"
        else if (strength >= 20)
            icon = "󰤟"
        else
            icon = "󰤯"
    }

    Component.onCompleted: update()
}