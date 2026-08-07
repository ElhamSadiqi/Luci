pragma Singleton

import QtQuick

QtObject {

    readonly property int defaultMode: 0
    readonly property int expandedMode: 1
    readonly property int powerMenuMode: 2
    readonly property int controlCenterMode: 3
    readonly property int themeSelectorMode: 4
    readonly property int wallpaperSelectorMode: 5
    readonly property int mediaControlsMode: 6

    property int mode: defaultMode

    property bool islandPinned: false
    property bool returnToExpanded: false

    property bool mediaPinned: false

    property bool ignoreNextIslandTap: false

    function setMode(newMode) {
        mode = newMode
    }

    function reset() {
        mediaPinned = false
        ignoreNextIslandTap = false
        islandPinned = false
        mode = defaultMode
    }

    readonly property bool modal:
        mode === powerMenuMode ||
        mode === themeSelectorMode ||
        mode === wallpaperSelectorMode

    readonly property bool dismissible:
        modal
}