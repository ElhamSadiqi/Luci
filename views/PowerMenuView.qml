import QtQuick
import "../widgets"
import "../services"
import "../managers"

FocusScope {
    id: root

    property int selectedIndex: 0

    Keys.onPressed: function(event) {

        switch (event.key) {

        case Qt.Key_Left:
        case Qt.Key_H:

            selectedIndex = (selectedIndex + 4) % 5
            event.accepted = true
            break

        case Qt.Key_Right:
        case Qt.Key_L:

            selectedIndex = (selectedIndex + 1) % 5
            event.accepted = true
            break

        case Qt.Key_Return:
        case Qt.Key_Enter:

            switch (selectedIndex) {

            case 0:
                PowerService.lock()
                break

            case 1:
                PowerService.suspend()
                break

            case 2:
                PowerService.logout()
                break

            case 3:
                PowerService.reboot()
                break

            case 4:
                PowerService.poweroff()
                break
            }

            event.accepted = true
            break

        case Qt.Key_Escape:

            IslandManager.reset()

            event.accepted = true
            break
        }
    }

    Row {
        anchors.centerIn: parent
        spacing: 8

        PowerOption {
            selected: root.selectedIndex === 0

            icon: "󰌾"
            title: "Lock"

            action: PowerService.lock
        }

        PowerOption {
            selected: root.selectedIndex === 1

            icon: "󰤄"
            title: "Sleep"

            action: PowerService.suspend
        }

        PowerOption {
            selected: root.selectedIndex === 2

            icon: "󰍃"
            title: "Logout"

            action: PowerService.logout
        }

        PowerOption {
            selected: root.selectedIndex === 3

            icon: "󰑐"
            title: "Reboot"

            action: PowerService.reboot
        }

        PowerOption {
            selected: root.selectedIndex === 4

            icon: ""
            title: "Power"

            action: PowerService.poweroff
        }
    }
}
