import QtQuick

import "../styles"
import "../services"

Item {
    id: root

    property int barCount: 5
    property int barWidth: 3
    property int spacingSize: 2

    property int baseHeight: 3
    property int extraHeight: 10

    implicitWidth:
        (barCount * barWidth) +
        ((barCount - 1) * spacingSize)

    implicitHeight:
        baseHeight + extraHeight

    Row {
        id: barsRow

        anchors.fill: parent

        spacing: root.spacingSize

        Repeater {

            model: root.barCount

            Rectangle {
                required property int index

                width: root.barWidth

                radius: width / 2

                anchors.bottom: parent.bottom

                color: Theme.textPrimary

                property real level:
                    index < CavaService.bars.length
                        ? CavaService.bars[index] / 100
                        : 0

                height:
                    root.baseHeight +
                    (level * root.extraHeight)

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