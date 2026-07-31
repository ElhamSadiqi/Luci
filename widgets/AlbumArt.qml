import QtQuick
import "../styles"
import "../services"

Rectangle {
    id: root

    width: 36
    height: 36
    radius: 8

    color: Theme.surface
    clip: true

    property string currentArt: ""

    property bool artworkReady: false

    Connections {
        target: MediaService

        function onArtUrlChanged() {
            root.currentArt = MediaService.artUrl
        }
    }

    Image {
        id: artwork

        anchors.fill: parent

        source: root.currentArt

        asynchronous: true
        cache: true
        smooth: true

        fillMode: Image.PreserveAspectCrop

        onStatusChanged: {
            root.artworkReady = (status === Image.Ready)
        }

        opacity: root.artworkReady ? 1 : 0

        Behavior on opacity {
            NumberAnimation {
                duration: 180
            }
        }
    }

    Text {
        anchors.centerIn: parent

        visible: !root.artworkReady

        text: "♪"

        font.pixelSize: 16

        color: Theme.textPrimary
    }

    Component.onCompleted: {
        if (MediaService.artUrl !== "")
            root.currentArt = MediaService.artUrl
    }
}
