pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root

    property var player: null

    readonly property bool playing: player !== null

    readonly property string title:
        player ? player.trackTitle : ""

    readonly property string artist:
        player ? player.trackArtist : ""

    readonly property string artUrl:
        player ? player.trackArtUrl : ""

    Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: {
            if (Mpris.players.values.length > 0) {
                root.player = Mpris.players.values[0]
            } else {
                root.player = null
                console.log("No player")
            }
        }
    }
}
