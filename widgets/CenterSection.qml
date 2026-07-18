import QtQuick
import "../views"
import "../styles"
import "../widgets"
import "../services"

Item {
    id: root

    property bool expanded: false

    implicitWidth: row.implicitWidth
    implicitHeight: expanded
        ? column.implicitHeight
        : row.implicitHeight


    Column {
        id: column

        anchors.centerIn: parent

        spacing: Theme.clockSpacing


        Row {
            id: row

            spacing: 8

            anchors.horizontalCenter: parent.horizontalCenter


            MiniCava {
                visible: MediaService.playing && !root.expanded

                anchors.verticalCenter: parent.verticalCenter
            }


            ClockView {
                id: clock
            }
        }


        DateView {
            visible: root.expanded

            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
