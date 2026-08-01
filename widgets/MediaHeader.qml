import QtQuick

Item {
    id: root

    implicitWidth: content.implicitWidth
    implicitHeight: content.implicitHeight

    Row {
        id: content

        spacing: 16

        anchors.verticalCenter: parent.verticalCenter

        AlbumArt {

            width: 56
            height: 56

            anchors.verticalCenter: parent.verticalCenter
        }

        SongInfo {

            showCava: false

            titleWidth: 140
            artistWidth: 220

            titleFontSize: 13
            artistFontSize: 12

            anchors.verticalCenter: parent.verticalCenter

            scale: 1.15

            transformOrigin: Item.Left
        }
    }
}