import QtQuick
import "../views"
import "../widgets"
import "../styles"
import "../services"
import "../managers"

Rectangle {
    id: root

    property int powerSelection: 0

    property bool locked: false

    Component.onCompleted: {
        ThemeService.initialize()
    }

    Connections {
        target: IslandManager

        function onModeChanged() {
            if (IslandManager.mode === IslandManager.powerMenuMode)
                keyboardFocus.forceActiveFocus()
        }
    }

    FocusScope {
        id: keyboardFocus

        anchors.fill: parent

        enabled: IslandManager.mode === IslandManager.powerMenuMode
        focus: enabled

        Keys.onPressed: function(event) {

            switch (IslandManager.mode) {

            case IslandManager.powerMenuMode:
                handlePowerMenu(event)
                break
            }
        }
    }

    radius: 23
    color: Theme.background

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
            return 520

        case IslandManager.themeSelectorMode:
        case IslandManager.wallpaperSelectorMode:
            return 550

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
            return 75

        case IslandManager.themeSelectorMode:
            return 410

        case IslandManager.wallpaperSelectorMode:
            return 480


        default:
            if (StatusManager.visible)
                return StatusManager.statusHeight

            return 33
        }
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 500
            easing.type: Easing.OutQuart
        }
    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: 500
            easing.type: Easing.OutQuart
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

            case IslandManager.themeSelectorMode:
                return themeSelectorView

            case IslandManager.wallpaperSelectorMode:
                return wallpaperSelectorView

            case IslandManager.appLauncherMode:
                return appLauncherView

            default:
                return defaultView
            }
        }
    }

    function handlePowerMenu(event) {

        switch (event.key) {

        case Qt.Key_Left:
        case Qt.Key_H:
            powerSelection = (powerSelection + 4) % 5
            event.accepted = true
            break

        case Qt.Key_Right:
        case Qt.Key_L:
            powerSelection = (powerSelection + 1) % 5
            event.accepted = true
            break

        case Qt.Key_Return:
        case Qt.Key_Enter:

            switch (powerSelection) {

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

        PowerMenuView {
            selectedIndex: root.powerSelection
        }
    }

    Component {
        id: controlCenterView

        Item { }
    }

    Component {
        id: themeSelectorView

        ThemeSelectorView { }
    }

    Component {
        id: wallpaperSelectorView

        WallpaperSelectorView { }
    }
}
