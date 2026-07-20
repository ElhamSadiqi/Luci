import QtQuick
import "../styles"

Rectangle {
    id: root

    property bool selected: false

    property string icon: ""
    property string title: ""

    property var action

    width: 93
    height: 58

    radius: 18

    color: selected ? Theme.accent : Theme.buttonBackground

    scale: selected ? 1.04 : 1.0

    Behavior on scale {
        NumberAnimation {
            duration: 130
            easing.type: Easing.OutCubic
        }
    }

    Behavior on color {
        ColorAnimation {
            duration: 130
        }
    }

    TapHandler {
        acceptedButtons: Qt.LeftButton

        onTapped: {
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

            color: selected ? Theme.background : Theme.textPrimary
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter

            text: root.title

            font.pixelSize: 11

            color: selected ? Theme.background : Theme.textPrimary
        }
    }
}
