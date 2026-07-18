import QtQuick
import "../styles"
import "../services"

Column {
    id: root

    spacing: 2

    readonly property bool hasMedia: MediaService.playing

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
}
