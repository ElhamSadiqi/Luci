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

        function readEvent() {
            var data = text().trim()

            if (!data)
                return

            var parts = data.split("|")

            if (parts.length !== 2)
                return

            var type = parts[0]
            var value = Number(parts[1])

            if (type === "volume") {

                if (value === -1) {

                    StatusManager.show({
                        mode: "volume",
                        icon: "󰝟",
                        title: "Muted",
                        value: -1
                    })

                    return
                }

                var icon

                if (value === 0)
                    icon = "󰝟"
                else if (value < 30)
                    icon = "󰕿"
                else if (value < 50)
                    icon = "󰖀"
                else if (value < 70)
                    icon = "󰕾"
                else
                    icon = ""

                StatusManager.show({
                    mode: "volume",
                    icon: icon,
                    title: value + "%",
                    value: value
                })
            }

            else if (type === "brightness") {

                var icon

                if (value < 25)
                    icon = "󰃞"
                else if (value < 60)
                    icon = "󰃟"
                else
                    icon = "󰃠"

                StatusManager.show({
                    mode: "brightness",
                    icon: icon,
                    title: value + "%",
                    value: value
                })
            }
        }
    }
}
