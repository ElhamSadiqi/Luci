import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../styles"
import "../services"

Item {

    id: root

    ColumnLayout {

        anchors.fill: parent
        spacing: 12

        RowLayout {

            Layout.fillWidth: true

            Text {
                text: "Notifications"

                color: Theme.textPrimary

                font.pixelSize: 16
                font.bold: true

                Layout.fillWidth: true
            }

            Rectangle {

                implicitWidth: 90
                implicitHeight: 32

                radius: Theme.radiusSmall

                color: Theme.buttonBackground

                border.width: clearMouse.containsMouse ? 1 : 0
                border.color: Theme.accent

                Text {

                    anchors.centerIn: parent

                    text: "Clear All"

                    color: clearMouse.containsMouse
                           ? Theme.textPrimary
                           : Theme.buttonText

                    font.pixelSize: 13
                }

                MouseArea {

                    id: clearMouse

                    anchors.fill: parent

                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: NotificationService.clear()
                }
            }
        }

        ScrollView {

            Layout.fillWidth: true
            Layout.fillHeight: true

            clip: true

            ListView {

                id: list

                width: parent.width

                model: NotificationService.history

                spacing: 10

                delegate: Rectangle {

                    width: list.width

                    height: Math.max(
                        100,
                        notificationColumn.implicitHeight + 24
                    )

                    radius: 12

                    color: Theme.card

                    RowLayout {

                        anchors.fill: parent
                        anchors.margins: 12

                        spacing: 14

                        //
                        // Left Preview
                        //

                        Rectangle {

                            Layout.alignment: Qt.AlignTop

                            width: 64
                            height: 64

                            radius: width / 2

                            clip: true

                            color: Theme.surfaceVariant

                            border.width: 1
                            border.color: Theme.borderSubtle

                            Image {

                                anchors.fill: parent

                                visible: model.image !== ""

                                source: model.image

                                asynchronous: true
                                cache: true

                                fillMode: Image.PreserveAspectCrop
                            }

                            Text {

                                anchors.centerIn: parent

                                visible: model.image === ""

                                text: "󰂚"

                                font.family: Theme.iconFont
                                font.pixelSize: 24

                                color: Theme.icon
                            }
                        }

                        //
                        // Right Side
                        //

                        ColumnLayout {

                            id: notificationColumn

                            Layout.fillWidth: true

                            spacing: 4

                            RowLayout {

                                Layout.fillWidth: true

                                Text {

                                    text: model.app

                                    color: Theme.textPrimary

                                    font.bold: true
                                    font.pixelSize: 14

                                    Layout.fillWidth: true

                                    elide: Text.ElideRight
                                }

                                Item {

                                    width: 28
                                    height: 28

                                    Rectangle {
                                        anchors.fill: parent

                                        radius: Theme.radiusSmall

                                        color: "transparent"

                                        border.width: removeMouse.containsMouse ? 1 : 0
                                        border.color: Theme.borderHover

                                        Text {
                                            anchors.centerIn: parent

                                            text: "󰅖"

                                            font.family: Theme.iconFont
                                            font.pixelSize: 15

                                            color: removeMouse.containsMouse
                                                ? Theme.danger
                                                : Theme.icon
                                        }
                                    }

                                    MouseArea {

                                        id: removeMouse

                                        anchors.fill: parent

                                        hoverEnabled: true

                                        cursorShape: Qt.PointingHandCursor

                                        onClicked: {

                                            NotificationService.remove(index)

                                        }
                                    }
                                }
                            }

                            Text {

                                text: model.summary

                                color: Theme.textPrimary

                                font.bold: true
                                font.pixelSize: 13

                                wrapMode: Text.WordWrap

                                Layout.fillWidth: true
                            }

                            Text {

                                text: model.body

                                color: Theme.textSecondary

                                font.pixelSize: 12

                                wrapMode: Text.WordWrap

                                textFormat: Text.RichText

                                maximumLineCount: 2

                                elide: Text.ElideRight

                                Layout.fillWidth: true
                            }

                            Text {

                                text: model.time

                                color: Theme.textMuted

                                font.pixelSize: 11
                            }
                        }
                    }
                }
            }
        }
    }

    Loader {

        anchors.centerIn: parent

        active: NotificationService.history.count === 0

        sourceComponent: emptyComponent
    }

    Component {

        id: emptyComponent

        Column {

            spacing: 8

            anchors.centerIn: parent

            Text {

                text: "󰂚"

                color: Theme.icon

                font.family: Theme.iconFont

                font.pixelSize: 36

                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {

                text: "No notifications"

                color: Theme.textSecondary

                font.pixelSize: 14
            }
        }
    }
}