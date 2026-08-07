import QtQuick

import "../styles"

Rectangle {
    id: root

    property string icon: ""
    property url iconSource: ""

    property real value: 0.5

    signal valueChangedByUser(real value)

    implicitWidth: 473
    implicitHeight: 35

    radius: 20

    color: Theme.surface

    Rectangle {
        width: root.value > 0
            ? Math.max(parent.height, parent.width * root.value)
            : 0

        height: parent.height

        radius: height / 2

        color: Theme.accent
    }

    SvgIcon {
        anchors.left: parent.left
        anchors.leftMargin: 14
        anchors.verticalCenter: parent.verticalCenter

        visible: root.iconSource !== ""

        source: root.iconSource

        size: 18

        color: Theme.textPrimary
    }

    Text {
        anchors.left: parent.left
        anchors.leftMargin: 14
        anchors.verticalCenter: parent.verticalCenter

        visible: root.iconSource === ""

        text: root.icon

        font.family: Theme.iconFont
        font.pixelSize: 18

        color: Theme.textPrimary
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onPressed: function(mouse) {
            updateValue(mouse.x)
        }


        onPositionChanged: function(mouse) {

            if (pressed)
                updateValue(mouse.x)

        }


        function updateValue(x) {

            let newValue =
                Math.max(
                    0,
                    Math.min(
                        1,
                        x / root.width
                    )
                )

            root.value = newValue

            root.valueChangedByUser(newValue)
        }
    }
}