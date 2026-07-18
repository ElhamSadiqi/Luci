import QtQuick
import "../services"

Item {
    id: root

    width: 26
    height: 8

    Row {
        id: barsRow

        anchors.fill: parent

        spacing: 2

        Repeater {
            model: 5

            Rectangle {
                required property int index

                width: 3

                radius: 2

                color: "#E5E7EB"

                anchors.bottom: parent.bottom

                property real level:
                    index < CavaService.bars.length
                        ? CavaService.bars[index] / 100
                        : 0

                height: 3 + (level * 10)

                Behavior on height {
                    NumberAnimation {
                        duration: 80
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }
    }
}
