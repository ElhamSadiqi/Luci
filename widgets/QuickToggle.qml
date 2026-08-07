import QtQuick
import QtQuick.Layouts

import "../styles"

Rectangle {
    id: root

    property string icon: ""
    property string label: ""

    property bool active: false

    signal clicked()

    width: 110
    height: 90

    radius: 18

    color: active
           ? Theme.accent
           : Theme.surface

    border.width: active ? 0 : 1
    border.color: Theme.surfaceVariant

    scale: tapHandler.pressed ? 0.96 : 1.0

    Behavior on scale {
        NumberAnimation {
            duration: 120
            easing.type: Easing.OutCubic
        }
    }

    Behavior on color {
        ColorAnimation {
            duration: 180
        }
    }

    ColumnLayout {

        anchors.centerIn: parent

        spacing: 8

        Text {

            text: root.icon

            Layout.alignment: Qt.AlignHCenter

            font.pixelSize: 24

            color:
                active
                ? "white"
                : Theme.textPrimary
        }

        Text {

            text: root.label

            Layout.alignment: Qt.AlignHCenter

            font.pixelSize: 12
            font.bold: true

            color:
                active
                ? "white"
                : Theme.textPrimary
        }
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }

    TapHandler {
        id: tapHandler

        acceptedButtons: Qt.LeftButton

        onTapped: root.clicked()
    }
}