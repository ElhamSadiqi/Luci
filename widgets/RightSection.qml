import QtQuick
import "../styles"
import "../status"
import "../services"

Item {
    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight


    Row {
        id: row

        anchors.right: parent.right
        anchors.rightMargin: Theme.sectionGap
        anchors.verticalCenter: parent.verticalCenter

        spacing: 10

        StatusChip {
            visible: StatusService.visible

            icon: StatusService.icon
            title: StatusService.title
        }

        Rectangle {
            id: pill

            color: "#1A1A1A"
            radius: 10

            implicitWidth: icons.implicitWidth + 18
            implicitHeight: icons.implicitHeight + 10

            Row {
                id: icons

                anchors.centerIn: parent

                spacing: 14

                Text {
                    text: "󰤨"
                    color: Theme.icon
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 16
                }

                Text {
                    text: "󰁹"
                    color: Theme.icon
                    font.family: "JetBrainsMono Nerd Font"
                    font.pixelSize: 16
                }
            }
        }
    }
}
