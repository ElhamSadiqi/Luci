import QtQuick
import "../styles"

Rectangle {
    id: root

    property string icon: ""
    property string title: ""

    property var action

    width: 93
    height: 58

    radius: 18

    color: "#1A1A1A"


    TapHandler {
        acceptedButtons: Qt.LeftButton

        onTapped: {
            console.log("POWER CLICK:", root.title)

            if (root.action)
                root.action()
        }
    }


    Column {
        anchors.centerIn: parent

        spacing: 2

        // visual only
        enabled: false

        Text {
            anchors.horizontalCenter: parent.horizontalCenter

            text: root.icon

            font.family: "JetBrainsMono Nerd Font"
            font.pixelSize: 20

            color: Theme.textPrimary
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter

            text: root.title

            font.pixelSize: 11

            color: Theme.textPrimary
        }
    }
}
