import QtQuick
import "../views"
import "../widgets"
import "../styles"
import "../services"
import "../managers"

Rectangle {
    id: root

    property bool locked: false

    radius: 23
    color: "#000000"

    width: implicitWidth
    height: implicitHeight

    readonly property bool isDefault:
        IslandManager.mode === IslandManager.defaultMode

    readonly property bool isExpanded:
        IslandManager.mode === IslandManager.expandedMode

    readonly property bool isPowerMenu:
        IslandManager.mode === IslandManager.powerMenuMode

    implicitWidth: {
        switch (IslandManager.mode) {

        case IslandManager.expandedMode:
        case IslandManager.powerMenuMode:
        case IslandManager.controlCenterMode:
        case IslandManager.themeSwitcherMode:
        case IslandManager.wallpaperSelectorMode:
            return 520

        default:
            if (StatusManager.visible)
                return StatusManager.statusWidth

            return 160
        }
    }

    implicitHeight: {
        switch (IslandManager.mode) {

        case IslandManager.expandedMode:
        case IslandManager.powerMenuMode:
        case IslandManager.controlCenterMode:
        case IslandManager.themeSwitcherMode:
        case IslandManager.wallpaperSelectorMode:
            return 75

        default:
            if (StatusManager.visible)
                return StatusManager.statusHeight

            return 33
        }
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

            if (IslandManager.modal)
                return

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

            if (IslandManager.modal)
                return

            root.locked = !root.locked

            if (root.locked) {
                expandTimer.stop()
                collapseTimer.stop()

                IslandManager.setMode(
                    IslandManager.expandedMode
                )
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

            if (IslandManager.modal)
                return

            IslandManager.setMode(
                IslandManager.expandedMode
            )
        }
    }

    Timer {
        id: collapseTimer

        interval: 250
        repeat: false

        onTriggered: {

            if (IslandManager.modal)
                return

            if (!root.locked)
                IslandManager.reset()
        }
    }

    Loader {
        id: centerLoader

        anchors.centerIn: parent

        width: item ? item.implicitWidth : 0
        height: item ? item.implicitHeight : 0

        sourceComponent: {

            if (
                IslandManager.mode === IslandManager.defaultMode &&
                StatusManager.visible
            )
                return overlayView

            switch (IslandManager.mode) {

            case IslandManager.expandedMode:
                return expandedView

            case IslandManager.powerMenuMode:
                return powerMenuView

            case IslandManager.controlCenterMode:
                return controlCenterView

            case IslandManager.themeSwitcherMode:
                return themeSwitcherView

            case IslandManager.wallpaperSelectorMode:
                return wallpaperSelectorView

            default:
                return defaultView
            }
        }
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

    Component {
        id: powerMenuView

        PowerMenuView { }
    }

    Component {
        id: controlCenterView

        Item { }
    }

    Component {
        id: themeSwitcherView

        Item { }
    }

    Component {
        id: wallpaperSelectorView

        Item { }
    }
}
