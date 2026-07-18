import QtQuick
import Quickshell
import "../components"

PanelWindow {
    id: root

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

    mask: Region {
        item: capsule
    }
}
