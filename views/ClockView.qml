import QtQuick

Item {
    id: root

    property bool expanded: false

    implicitWidth: clock.implicitWidth
    implicitHeight: clock.implicitHeight

    Text {
        id: clock

        anchors.centerIn: parent

        color: "#E5E7EB"

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 18
        font.bold: true

        text: Qt.formatTime(new Date(), "HH:mm")

        Timer {
            interval: 1000
            running: true
            repeat: true

            onTriggered: {
                clock.text = Qt.formatTime(new Date(), "HH:mm")
            }
        }
    }
}
