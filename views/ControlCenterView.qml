import QtQuick
import QtQuick.Layouts

import "../styles"
import "../widgets"
import "../managers"
import "../views"
import "../services"

Item {
    id: root

    property Item wifiSvc

    implicitWidth: 520
    implicitHeight: 530

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 22

        spacing: 18

        Text {
            text: "Control Center"

            color: Theme.textPrimary

            font.pixelSize: 20
            font.bold: true

            Layout.alignment: Qt.AlignLeft
        }

        GridLayout {
            Layout.fillWidth: true

            columns: 3

            columnSpacing: 12
            rowSpacing: 12

            ControlCard {

                iconSource: WifiService.svgIcon

                title: "Wi-Fi"

                subtitle: WifiService.subtitle

                active: WifiService.connected

                onClicked: WifiService.toggle()
            }

            ControlCard {

                iconSource: BluetoothService.icon

                title: "Bluetooth"

                subtitle: BluetoothService.subtitle

                active: BluetoothService.enabled

                onClicked: BluetoothService.toggle()
            }

            ControlCard {

                iconSource: MicrophoneService.icon

                title: "Microphone"

                subtitle: MicrophoneService.subtitle

                active: !MicrophoneService.muted

                onClicked: MicrophoneService.toggle()
            }

            ControlCard {

                iconSource: NightLightService.icon

                title: "Night Light"

                subtitle: NightLightService.subtitle

                active: NightLightService.enabled

                onClicked: NightLightService.toggle()
            }

            ControlCard {

                iconSource: FocusService.icon

                title: "Focus"

                subtitle: FocusService.subtitle

                active: FocusService.enabled

                onClicked: FocusService.toggle()
            }

            ControlCard {

                iconSource: MediaService.icon

                title: "Media"

                subtitle: MediaService.subtitle

                active: MediaService.hasPlayer

                onClicked: {

                    IslandManager.ignoreNextIslandTap = true

                    IslandManager.returnToExpanded =
                        IslandManager.islandPinned

                    IslandManager.islandPinned = true

                    IslandManager.setMode(
                        IslandManager.mediaControlsMode
                    )
                }
            }
        }

        ControlSlider {

            iconSource: AudioService.volumeIcon

            value: AudioService.volume / 100

            onValueChangedByUser: function(value) {

                AudioService.setVolume(
                    value * 100
                )
            }
        }

        ControlSlider {

            iconSource: BrightnessService.brightnessIcon

            value: BrightnessService.brightness / 100

            onValueChangedByUser: function(value) {

                BrightnessService.setBrightness(
                    value * 100
                )
            }
        }

        Rectangle {

            Layout.fillWidth: true
            Layout.fillHeight: true

            radius: 14

            color: Theme.surface

            clip: true

            NotificationView {
                anchors.fill: parent
                anchors.margins: 14
            }
        }
    }
}