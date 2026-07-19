import QtQuick
import "../widgets"
import "../services"

Item {

    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight


    Row {
        id: row

        anchors.centerIn: parent

        spacing: 8


        PowerOption {
            icon: "󰌾"
            title: "Lock"
            action: PowerService.lock
        }

        PowerOption {
            icon: "󰤄"
            title: "Sleep"
        }

        PowerOption {
            icon: "󰍃"
            title: "Logout"
        }

        PowerOption {
            icon: "󰑐"
            title: "Reboot"
        }

        PowerOption {
            icon: ""
            title: "Power"
        }
    }
}
