import QtQuick
import QtQuick.Layouts
import "../styles"
import "../managers"

Item {
    id: root

    implicitWidth: 280
    implicitHeight: 26

    property int maximum: 100

    RowLayout {
        anchors.fill: parent

        spacing: 10

        Text {
            text: StatusManager.icon

            color: Theme.textPrimary
            font.family: "JetBrainsMono Nerd Font"
            font.pixelSize: 15

            Layout.alignment: Qt.AlignVCenter
        }

        Rectangle {
            id: bar

            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter

            height: 6
            radius: height / 2

            color: "#2A2A2A"

            Rectangle {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                height: parent.height
                radius: height / 2

                width: Math.max(
                    0,
                    Math.min(
                        parent.width,
                        parent.width * StatusManager.value / maximum
                    )
                )

                color: Theme.accent

                Behavior on width {
                    NumberAnimation {
                        duration: 180
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }

        Text {
            text: StatusManager.value >= 0
                  ? StatusManager.value + "%"
                  : "Muted"

            color: Theme.textPrimary
            font.pixelSize: 12
            font.weight: Font.Medium

            Layout.alignment: Qt.AlignVCenter
        }
    }
}