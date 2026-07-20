pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property ListModel wallpapers: ListModel {}

    // ==========================
    // Scan wallpapers
    // ==========================

    Process {
        id: scanProcess

        command: [
            "bash",
            "-c",
            "find $HOME/Pictures/Wallpapers -maxdepth 1 -type f \\( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.gif' \\) | sort"
        ]

        stdout: SplitParser {

            splitMarker: "\n"

            onRead: function(line) {

                if (line.trim().length === 0)
                    return

                root.wallpapers.append({
                    path: line.trim()
                })
            }
        }

        onStarted: {
            root.wallpapers.clear()
        }

        onExited: {
            console.log("Wallpaper scan finished.")
        }
    }

    // ==========================
    // Apply wallpaper
    // ==========================

    Process {
        id: applyProcess
    }

    function apply(path) {

        applyProcess.command = [
            "awww",
            "img",
            path,

            "--transition-type", "grow",
            "--transition-duration", "2",
            "--transition-fps", "60"
        ]

        applyProcess.running = true
    }

    // ==========================
    // Reload list
    // ==========================

    function reload() {
        scanProcess.running = true
    }

    Component.onCompleted: {
        reload()
    }
}