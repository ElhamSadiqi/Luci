import QtQuick
import "../views"
import "../services"
import "../widgets"

Item {
    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

    Row {
        id: row

        spacing: 8

        anchors.centerIn: parent

        MiniCava {
            visible: MediaService.playing
            anchors.verticalCenter: parent.verticalCenter
        }

        ClockView { }
    }
}
