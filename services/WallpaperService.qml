pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

import "."

Singleton {

    id: root

    // =========================================================
    // Models
    // =========================================================

    property ListModel allWallpapers: ListModel {}
    property ListModel themeWallpapers: ListModel {}

    property ListModel currentModel: allWallpapers

    property bool themeOnly: false

    // loaded from wallpapers.json later
    property var wallpaperMetadata: []

    // =========================================================
    // Theme filter
    // =========================================================

    function setFilter(theme) {

        themeOnly = theme

        currentModel = theme
            ? themeWallpapers
            : allWallpapers
    }

    Process {

        id: metadataProcess

        command: [
            "cat",
            Quickshell.env("HOME") + "/.config/quickshell/assets/wallpapers.json"
        ]

        stdout: StdioCollector {

            onStreamFinished: {

                try {

                    root.wallpaperMetadata =
                            JSON.parse(this.text)

                } catch(err) {

                    console.log(
                        "Failed to parse wallpapers.json:",
                        err
                    )

                    root.wallpaperMetadata = []
                }

                root.reload()
            }
        }
    }

    // =========================================================
    // Scan wallpapers
    // =========================================================

    Process {

        id: scanProcess

        command: [
            "bash",
            "-c",
            "find $HOME/Pictures/wallpapers -maxdepth 1 -type f \\( \
                -iname '*.jpg'  -o \
                -iname '*.jpeg' -o \
                -iname '*.png'  -o \
                -iname '*.webp' -o \
                -iname '*.gif' \
            \\) | sort"
        ]

        stdout: SplitParser {

            splitMarker: "\n"

            onRead: function(line) {

                let path = line.trim()

                if (path.length === 0)
                    return

                // --------------------------
                // Add to ALL model
                // --------------------------

                root.allWallpapers.append({
                    path: path
                })

                // --------------------------
                // Theme model
                // --------------------------

               let filename = path.split("/").pop()

                let currentTheme = ThemeService.currentTheme.toLowerCase()

                for (let i = 0; i < root.wallpaperMetadata.length; ++i) {

                    let group = root.wallpaperMetadata[i]

                    if (group.theme !== currentTheme)
                        continue

                    if (group.files.indexOf(filename) !== -1) {

                        root.themeWallpapers.append({
                            path: path
                        })

                        break
                    }
                }
            }
        }

        onStarted: {

            root.allWallpapers.clear()
            root.themeWallpapers.clear()
        }
    }

    // =========================================================
    // Apply wallpaper
    // =========================================================

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

    // =========================================================
    // Reload
    // =========================================================
    function reload() {

        currentModel = themeOnly
            ? themeWallpapers
            : allWallpapers

        scanProcess.running = true
    }

    Component.onCompleted: {

        metadataProcess.running = true
    }
}