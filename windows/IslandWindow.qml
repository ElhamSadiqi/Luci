import QtQuick
import Quickshell
import Quickshell.Hyprland

import "../components"
import "../managers"

PanelWindow {
    id: root

    HyprlandFocusGrab {
        id: focusGrab

        active: IslandManager.mode === IslandManager.powerMenuMode
        windows: [ root ]

        onCleared: {
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
    implicitHeight: 85

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
