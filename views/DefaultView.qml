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

        Cava {
            visible: MediaService.hasPlayer
            anchors.verticalCenter: parent.verticalCenter
        }

        ClockView { }
    }
}
