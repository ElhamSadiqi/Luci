import QtQuick
import Quickshell
import Quickshell.Hyprland

import "../components"
import "../managers"

PanelWindow {
    id: root

    HyprlandFocusGrab {
        id: focusGrab

        active: IslandManager.modal

        windows: [ root ]

        onActiveChanged: {
            console.log("Focus grab:", active)
        }

        onCleared: {
            console.log("Focus grab cleared")

            IslandManager.reset()
        }
    }

    focusable: focusGrab.active

    anchors {
        top: true
        left: true
        right: true
    }

    exclusiveZone: 33
    implicitHeight: capsule.implicitHeight + 20

    color: "transparent"

    MainCapsule {
        id: capsule

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    Region {
        id: capsuleMask
        item: capsule
    }

    mask: capsuleMask
}
