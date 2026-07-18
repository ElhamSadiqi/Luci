pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property bool visible: false

    property string icon: ""
    property string title: ""

    function show(data) {
        icon = data.icon
        title = data.title

        visible = true

        hideTimer.restart()
    }

    Timer {
        id: hideTimer

        interval: 1800
        repeat: false

        onTriggered: {
            root.visible = false
        }
    }
}
