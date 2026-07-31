import QtQuick
import "../styles"
import "../services"

Column {
    id: root

    spacing: 2

    readonly property bool hasMedia: MediaService.hasPlayer

    Row {
        spacing: 6

        MiniCava {
            anchors.verticalCenter: parent.verticalCenter
            visible: hasMedia
        }

        ScrollingText {
            text: hasMedia
                    ? (MediaService.title || "No Title")
                    : "Nothing"

            maxWidth: 80

            anchors.verticalCenter: parent.verticalCenter
        }
    }

    ScrollingText {
        text: hasMedia
                ? (MediaService.artist || "Unknown Artist")
                : "Playing"

        maxWidth: 130

        fontSize: 11

        opacity: 0.7
    }

    Connections {
        target: MediaService

        function onTitleChanged() {
            console.log("TITLE:", MediaService.title)
        }

        function onArtistChanged() {
            console.log("ARTIST:", MediaService.artist)
        }

        function onHasPlayerChanged() {
            console.log("HAS PLAYER:", MediaService.hasPlayer)
        }
    }
}
