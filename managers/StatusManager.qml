pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property bool visible: false

    property string mode: ""
    property string icon: ""
    property string title: ""
    property int value: 0

    property int statusWidth: 160
    property int statusHeight: 33


    function show(data) {

        mode = data.mode
        icon = data.icon
        title = data.title
        value = data.value

        statusWidth = data.statusWidth ?? 160
        statusHeight = data.statusHeight ?? 33

        visible = true

        hideTimer.restart()

        console.log(
            "SHOW:",
            mode,
            title,
            value,
            statusWidth,
            visible
        )
    }


    Timer {
        id: hideTimer

        interval: 1800
        repeat: false

        onTriggered: {
            console.log("HIDE")
            root.visible = false
        }
    }
}
