import QtQuick
import "../styles"
import "../status"
import "../managers"

Item {

    property Item batteryService
    property Item wifiService


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


            Row {
                id: icons

                anchors.centerIn: parent

                spacing: 14


                Text {
                    text: wifiService
                        ? wifiService.icon
                        : "󰤮"

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