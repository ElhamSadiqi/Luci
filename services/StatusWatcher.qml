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

            if (parts.length !== 2)
                return

            var type = parts[0]
            var value = parts[1]

            if (type === "volume") {

                if (value === "muted") {

                    StatusManager.show({
                        icon: "󰝟",
                        title: "Muted"
                    })

                    return
                }

                var volume = Number(value)

                var icon

                if (volume === 0)
                    icon = "󰝟"
                else if (volume < 30)
                    icon = "󰕿"
                else if (volume < 50)
                    icon = "󰖀"
                else if (volume < 70)
                    icon = "󰕾"
                else
                    icon = ""

                StatusManager.show({
                    icon: icon,
                    title: volume + "%"
                })
            }

            else if (type === "brightness") {

                var brightness = Number(value)

                var icon

                if (brightness < 25)
                    icon = "󰃞"
                else if (brightness < 60)
                    icon = "󰃟"
                else
                    icon = "󰃠"

                StatusManager.show({
                    icon: icon,
                    title: brightness + "%"
                })
            }
        }
    }
}
