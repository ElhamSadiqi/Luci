import QtQuick
import "../views"
import "../widgets"
import "../styles"
import "../services"
import "../managers"

Rectangle {
    id: root

    property bool expanded: false
    property bool locked: false

    radius: 23
    color: "#000000"

    implicitWidth: {
        if (root.expanded)
            return 520

        if (StatusManager.visible)
            return 300    // we'll tweak this later

        return 160
    }

    implicitHeight: {
        if (root.expanded)
            return 75

        if (StatusManager.visible)
            return 33    // tweak later

        return 33
    }


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

    Loader {
        id: centerLoader

        anchors.centerIn: parent

        sourceComponent: {
            if (root.expanded)
                return expandedView

            if (StatusManager.visible)
                return overlayView

            return defaultView
        }
    }

    RightSection {
        id: rightSection

        visible: root.expanded

        anchors.right: parent.right
        anchors.rightMargin: Theme.capsulePadding
        anchors.verticalCenter: parent.verticalCenter
    }

    Component {
        id: defaultView

        DefaultView { }
    }

    Component {
        id: overlayView

        OverlayView { }
    }

    Component {
        id: expandedView

        ExpandedView { }
    }
}
