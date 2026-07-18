pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property var bars: []

    Process {
        id: cava

        running: true

        command: [
            "cava",
            "-p",
            "/home/Arch/.config/quickshell/scripts/cava.conf"
        ]

        stdout: SplitParser {
            splitMarker: "\n"

            onRead: function(line) {
                if (line.trim().length === 0)
                    return

                const values = line.trim().split(";")
                const parsed = []

                for (let i = 0; i < values.length; ++i) {
                    if (values[i] !== "")
                        parsed.push(Number(values[i]))
                }

                root.bars = parsed
            }
        }

        onStarted: {
            console.log("Cava started")
        }

        onExited: function(exitCode, exitStatus) {
            console.log("Cava exited:", exitCode)
        }
    }
}
