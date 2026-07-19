import QtQuick
import "../widgets"
import "../services"

Item {

    Row {
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
            action: PowerService.suspend
        }

        PowerOption {
            icon: "󰍃"
            title: "Logout"
            action: PowerService.logout
        }

        PowerOption {
            icon: "󰑐"
            title: "Reboot"
            action: PowerService.reboot
        }

        PowerOption {
            icon: ""
            title: "Power"
            action: PowerService.poweroff
        }
    }
}
