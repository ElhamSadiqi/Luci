import QtQuick
import QtQuick.Layouts

import "../styles"

Rectangle {
    id: root

    property string icon: ""
    property url iconSource: ""
    property string title: ""
    property string subtitle: ""
    property bool active: false

    signal clicked()

    implicitWidth: 150
    implicitHeight: 60

    radius: 20

    color: Theme.surface

    border.width: 1
    border.color: active
                  ? Theme.accent
                  : Theme.border
    
    Row {
        anchors.fill: parent
        anchors.margins: 12

        spacing: 10

        Rectangle {
            width: 36
            height: 36
            radius: 18

            color: active
                ? Theme.accent
                : Theme.buttonBackground

            SvgIcon {
                anchors.centerIn: parent

                visible: !!root.iconSource

                source: root.iconSource

                size: 18

                color: active
                    ? Theme.background
                    : Theme.textPrimary
            }

            Text {
                anchors.centerIn: parent

                visible: !root.iconSource

                text: root.icon

                font.family: Theme.iconFont
                font.pixelSize: 18

                color: active
                    ? Theme.background
                    : Theme.textPrimary
            }
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter

            anchors.top: parent.top
            anchors.topMargin: 1

            spacing: 2

            width: 80   

            Text {
                width: parent.width

                text: root.title

                color: Theme.textPrimary

                font.pixelSize: 13
                font.bold: true

                elide: Text.ElideRight
            }

            Text {
                width: parent.width

                text: root.subtitle

                color: Theme.textSecondary

                font.pixelSize: 11

                elide: Text.ElideRight
            }
        }
    }

    HoverHandler {
        cursorShape: Qt.PointingHandCursor
    }

    TapHandler {
        onTapped: root.clicked()
    }
}