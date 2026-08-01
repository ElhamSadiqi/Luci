import QtQuick
import QtQuick.Layouts

import "../services"
import "../styles"

Item {
    id: root

    property int barCount: 54
    property int spacing: 2

    property int centerHeight: 30
    property int maxAmplitude: 18

    implicitWidth:
        leftTime.implicitWidth +
        waveform.implicitWidth +
        rightTime.implicitWidth +
        20

    implicitHeight: centerHeight + (maxAmplitude * 2)

    RowLayout {

        anchors.fill: parent

        spacing: 10

        Text {
            id: leftTime
            
            text:                
                MediaService.formatTime(
                    MediaService.position
                )

            color: Theme.textSecondary
            font.pixelSize: 16
        }

        Item {

            id: waveform

            Layout.fillWidth: true
            Layout.preferredHeight: root.implicitHeight

            implicitWidth:
                (root.barCount * root.barWidth) +
                ((root.barCount - 1) * root.spacing)

            Row {

                anchors.centerIn: parent

                spacing: root.spacing

                Repeater {

                    model: root.barCount

                    Rectangle {

                        required property int index

                        width: 5

                        color: Theme.accent

                        property real level:
                            index < CavaService.bars.length
                                ? CavaService.bars[index] / 100
                                : 0

                        height:
                            8 + (level * 50)

                        anchors.verticalCenter: parent.verticalCenter

                        Behavior on height {
                            NumberAnimation {
                                duration: 70
                                easing.type: Easing.OutCubic
                            }
                        }
                    }
                }
            }
        }

        Text {
            id: rightTime

            text:
                MediaService.formatTime(
                    MediaService.length
                )

            color: Theme.textSecondary
            font.pixelSize: 16
        }
    }
}