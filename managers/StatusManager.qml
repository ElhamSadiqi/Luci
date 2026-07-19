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

    function show(data) {
        mode = data.mode
        icon = data.icon
        title = data.title 
        value  = data.value 

        visible = true

        hideTimer.restart()
        console.log( "SHOW:",mode,title,value,visible)
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
