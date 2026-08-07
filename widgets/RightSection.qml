import QtQuick

import "../styles"
import "../status"
import "../managers"
import "../services"

Item {

    property Item batteryService

    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

    Row {
        id: row

        anchors.right: parent.right
        anchors.rightMargin: Theme.sectionGap
        anchors.verticalCenter: parent.verticalCenter

        spacing: 10

        StatusChip {
            visible: StatusManager.visible

            icon: StatusManager.icon
            title: StatusManager.title
        }

        Rectangle {
            id: pill

            color: Theme.surface
            radius: 10

            implicitWidth: icons.implicitWidth + 18
            implicitHeight: icons.implicitHeight + 10

            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }

            TapHandler {

                acceptedButtons: Qt.LeftButton
                gesturePolicy: TapHandler.ReleaseWithinBounds

                onTapped: function(event) {

                    event.accepted = true

                    if (
                        IslandManager.mode === IslandManager.controlCenterMode
                    )
                        return

                    IslandManager.returnToExpanded =
                        IslandManager.islandPinned

                    IslandManager.islandPinned = false

                    IslandManager.setMode(
                        IslandManager.controlCenterMode
                    )
                }
            }

            Row {
                id: icons

                anchors.centerIn: parent

                spacing: 14

                Text {
                    text: WifiService.icon
                    color: Theme.icon

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 16
                }

                Text {
                    text: batteryService
                          ? batteryService.icon
                          : "󰁺"

                    color: Theme.icon

                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 16
                }
            }
        }
    }
}