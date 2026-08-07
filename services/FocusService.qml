pragma Singleton

import QtQuick
import Quickshell

Singleton {

    id: root

    property bool enabled: false

    property string subtitle: enabled ? "Enabled" : "Off"

    property url icon: enabled
        ? Qt.resolvedUrl("../assets/icons/bell.svg")
        : Qt.resolvedUrl("../assets/icons/bell-off.svg")

    function toggle() {
        enabled = !enabled
    }
}