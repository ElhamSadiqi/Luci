import QtQuick
import "../styles"

Rectangle {
    id: root

    property string themeName: ""

    property color backgroundColor: "#202020"

    property color color1: "#FFFFFF"
    property color color2: "#AAAAAA"
    property color color3: "#555555"

    property color accentColor: "#FFFFFF"
    property color textColor: "#FFFFFF"

    property bool selected: false

    width: 160
    height: 100

    radius: 16

    color: backgroundColor

    border.width: selected ? 3 : 1
    border.color: selected ? Theme.accent : Theme.border

    Column {

        anchors.fill: parent

        anchors.margins: 12

        spacing: 8

        // ====================================
        // Color Preview
        // ====================================

        Row {

            spacing: 6

            Rectangle {
                width: 24
                height: 24
                radius: 6
                color: root.color1
            }

            Rectangle {
                width: 24
                height: 24
                radius: 6
                color: root.color2
            }

            Rectangle {
                width: 24
                height: 24
                radius: 6
                color: root.color3
            }
        }

        Item {
            width: 1
            height: 8
        }

        // Accent Line

        Rectangle {

            width: 70
            height: 4

            radius: 2

            color: root.accentColor
        }

        // Theme Name

        Text {

            text: root.themeName

            color: root.textColor

            font.pixelSize: 13

            font.bold: true
        }
    }

    // Selection overlay

    Rectangle {

        anchors.fill: parent

        radius: parent.radius

        visible: selected

        color: "#00000022"

        border.width: 2

        border.color: Theme.accent
    }
}
