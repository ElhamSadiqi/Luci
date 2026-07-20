pragma Singleton

import QtQuick

QtObject {

    // Main UI Modes
    readonly property int defaultMode: 0
    readonly property int expandedMode: 1
    readonly property int powerMenuMode: 2
    readonly property int controlCenterMode: 3
    readonly property int themeSelectorMode: 4
    readonly property int wallpaperSelectorMode: 5

    property int mode: defaultMode

    function setMode(newMode) {
        mode = newMode
    }

    function reset() {
        mode = defaultMode
    }

    readonly property bool modal:
        mode === powerMenuMode ||
        mode === controlCenterMode ||
        mode === themeSelectorMode ||
        mode === wallpaperSelectorMode

    readonly property bool dismissible:
        modal
}
