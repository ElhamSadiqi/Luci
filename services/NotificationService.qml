pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {

    id: root

    property ListModel history: ListModel {}

    property int unreadCount: 0

    NotificationServer {

        id: server

        keepOnReload: true

        onNotification: function(notification) {

            notification.tracked = true

            let image = ""

            if (notification.hints["image-path"]) {
                image = notification.hints["image-path"]
            }

            root.history.insert(0, {

                app: notification.appName,

                summary: notification.summary,

                body: notification.body,

                image: image,

                time: new Date().toLocaleTimeString()
            })

            root.unreadCount++

            console.log("Stored notification:", notification.summary)
            console.log("Image:", image)
        }
    }

    function clear() {

        history.clear()

        unreadCount = 0
    }

    function remove(index) {

        if (index >= 0 && index < history.count) {
            history.remove(index, 1)
        }

    }

    function markRead() {

        unreadCount = 0
    }

    Component.onCompleted: {

        console.log(
            "NotificationService loaded"
        )
    }
 
}