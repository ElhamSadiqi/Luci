import QtQuick
import "../services"

Item {
    id: root

    implicitWidth: content.implicitWidth
    implicitHeight: content.implicitHeight

    Row {
        id: content

        spacing: 10

        anchors.verticalCenter: parent.verticalCenter

        AlbumArt {
            anchors.verticalCenter: parent.verticalCenter
        }

        SongInfo {
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
