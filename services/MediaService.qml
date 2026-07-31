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

    readonly property bool hasPlayer: player !== null
    
    function updatePlayer() {
        if (Mpris.players.values.length === 0) {
            player = null

            title = ""
            artist = ""
            artUrl = ""

            return
        }

        if (player !== Mpris.players.values[0])
            player = Mpris.players.values[0]

        title = player.trackTitle
        artist = player.trackArtist

        // Keep the last valid artwork. Some MPRIS implementations briefly report
        // an empty artwork URL even though the media hasn't actually changed.
        if (player.trackArtUrl !== "")
            artUrl = player.trackArtUrl
    }

    Timer {
        interval: 1000
        running: true
        repeat: true

        onTriggered: root.updatePlayer()
    }

    Connections {
        target: player

        function onTrackTitleChanged() {
            root.title = player.trackTitle
        }

        function onTrackArtistChanged() {
            root.artist = player.trackArtist
        }

        function onTrackArtUrlChanged() {
            if (player.trackArtUrl !== "")
                root.artUrl = player.trackArtUrl
        }
    }
}