pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root

    property var player: null

    property string title: ""
    property string artist: ""
    property string artUrl: ""

    readonly property bool playing: player !== null

    Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: {

            if (Mpris.players.values.length === 0) {
                player = null
                return
            }

            player = Mpris.players.values[0]

            if (player.trackTitle !== "")
                title = player.trackTitle

            if (player.trackArtist !== "")
                artist = player.trackArtist

            if (player.trackArtUrl !== "")
                artUrl = player.trackArtUrl
        }
    }
}