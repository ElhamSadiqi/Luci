import QtQuick
import "../views"
import "../widgets"
import "../styles"
import "../services"

Rectangle {
    id: root

    property bool expanded: false
    property bool locked: false

    radius: 23
    color: "#000000"

    implicitWidth: expanded ? 520 : 160
    implicitHeight: expanded ? 75 : 33

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 220
            easing.type: Easing.OutCubic
        }
    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: 220
            easing.type: Easing.OutCubic
        }
    }

    HoverHandler {
        id: hover

        onHoveredChanged: {
            if (hover.hovered) {
                collapseTimer.stop()
                expandTimer.restart()
            } else {
                expandTimer.stop()

                if (!root.locked)
                    collapseTimer.restart()
            }
        }
    }

    TapHandler {
        acceptedButtons: Qt.LeftButton

        onTapped: {
            root.locked = !root.locked

            if (root.locked) {
                expandTimer.stop()
                collapseTimer.stop()
                root.expanded = true
            } else {
                if (!hover.hovered)
                    collapseTimer.restart()
            }
        }
    }

    Timer {
        id: expandTimer

        interval: 120
        repeat: false

        onTriggered: {
            root.expanded = true
        }
    }

    Timer {
        id: collapseTimer

        interval: 250
        repeat: false

        onTriggered: {
            if (!root.locked)
                root.expanded = false
        }
    }

    LeftSection {
        id: leftSection

        visible: root.expanded

        anchors.left: parent.left
        anchors.leftMargin: Theme.capsulePadding
        anchors.verticalCenter: parent.verticalCenter   
    }

    CenterSection {
        id: centerSection

        expanded: root.expanded

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    RightSection {
        id: rightSection

        visible: root.expanded

        anchors.right: parent.right
        anchors.rightMargin: Theme.capsulePadding
        anchors.verticalCenter: parent.verticalCenter
    }
}
