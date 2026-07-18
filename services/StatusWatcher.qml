import QtQuick
import Quickshell
import Quickshell.Io
import "../managers"

Item {
    id: root

    FileView {
        id: eventFile

        path: Quickshell.env("HOME") +
              "/.cache/quickshell/status/event"

        watchChanges: true
        blockAllReads: true

        onFileChanged: {
            reload()
            readEvent()
        }

        Component.onCompleted: {
            readEvent()
        }

        function readEvent() {
            var data = text().trim()

            if (!data)
                return

            var parts = data.split("|")

            if (parts.length !== 3)
                return

            StatusManager.show({
                icon: parts[1],
                title: parts[2]
            })
        }
    }
}
