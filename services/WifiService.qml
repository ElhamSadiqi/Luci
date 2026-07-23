import QtQuick
import Quickshell
import Quickshell.Io

Item {
    id: root

    property bool connected: false
    property int strength: 0
    property string ssid: ""
    property string icon: "󰤮"

    Process {
        id: wifiReader

        running: true

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
                    updateIcon()
                    return
                }

                let parts = line.split(":")

                root.connected = true
                root.strength = Number(parts[1])
                root.ssid = parts.slice(2).join(":")

                updateIcon()

                console.log(
                    "WiFi:",
                    root.connected,
                    root.strength,
                    root.ssid,
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
            wifiReader.running = false
            wifiReader.running = true
        }
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
}
