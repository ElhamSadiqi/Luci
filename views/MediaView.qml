import QtQuick
import QtQuick.Layouts

import "../widgets"
import "../services"
import "../styles"

Item {
    id: root

    implicitWidth: 520
    implicitHeight: 145

    ColumnLayout {

        anchors.fill: parent
        anchors.margins: 22

        spacing: 0

        RowLayout {

            Layout.fillWidth: true

            spacing: 20

            MediaHeader {
                Layout.fillWidth: true
            }

            RowLayout {

                Layout.alignment: Qt.AlignVCenter

                Layout.topMargin: 10

                spacing: 14

                Rectangle {

                    width: 34
                    height: 34
                    radius: 17

                    color: Theme.surface

                    Image {
                        anchors.centerIn: parent

                        width: 18
                        height: 18

                        source: "../assets/icons/player-skip-back.svg"

                        fillMode: Image.PreserveAspectFit
                    }

                    HoverHandler {
                        cursorShape: Qt.PointingHandCursor
                    }

                    TapHandler {
                        acceptedButtons: Qt.LeftButton
                        onTapped: MediaService.previousTrack()
                    }
                }

                Rectangle {

                    width: 42
                    height: 42
                    radius: 21

                    color: Theme.accent

                    Image {
                        anchors.centerIn: parent

                        width: 20
                        height: 20

                        source:
                            MediaService.isPlaying
                                ? "../assets/icons/player-pause.svg"
                                : "../assets/icons/player-play.svg"

                        fillMode: Image.PreserveAspectFit
                    }

                    HoverHandler {
                        cursorShape: Qt.PointingHandCursor
                    }

                    TapHandler {

                        acceptedButtons: Qt.LeftButton

                        onTapped: {
                            MediaService.togglePlayback()
                        }
                    }
                }

                Rectangle {

                    width: 34
                    height: 34
                    radius: 17

                    color:  Theme.surface

                    Image {
                        anchors.centerIn: parent

                        width: 18
                        height: 18

                        source: "../assets/icons/player-skip-forward.svg"

                        fillMode: Image.PreserveAspectFit
                    }

                    HoverHandler {
                        cursorShape: Qt.PointingHandCursor
                    }

                    TapHandler {
                        acceptedButtons: Qt.LeftButton
                        onTapped: MediaService.nextTrack()
                    }
                }    
            }
        }

        WaveformProgress {
            Layout.fillWidth: true
        }
    }
}