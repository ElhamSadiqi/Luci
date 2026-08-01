import QtQuick
import QtQml

import "../styles"
import "../services"


Column {
    id: root

    property bool showCava: true

    property int titleWidth: 80
    property int artistWidth: 130

    property int titleFontSize: 13
    property int artistFontSize: 11

    spacing: 2

    readonly property bool hasMedia: MediaService.hasPlayer

    Row {
        spacing: 6

        Cava {

            visible: hasMedia && root.showCava

            anchors.verticalCenter: parent.verticalCenter
        }

        ScrollingText {

            text: hasMedia
                    ? (MediaService.title || "No Title")
                    : "Nothing"

            maxWidth: root.titleWidth

            fontSize: root.titleFontSize
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    ScrollingText {

        text: hasMedia
                ? (MediaService.artist || "Unknown Artist")
                : "Playing"

        maxWidth: root.artistWidth

        fontSize: root.artistFontSize

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