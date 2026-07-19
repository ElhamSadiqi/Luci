import QtQuick
import Quickshell
import Quickshell.Hyprland
import "../managers"

Item {

    Connections {
        target: Hyprland

        function onRawEvent(event) {

            if (event.name === "workspace") {

                var workspace = event.data

                StatusManager.show({
                    mode: "workspace",
                    icon: "󰍹",
                    title: workspace,
                    value: Number(workspace),

                    statusWidth: 200,
                    statusHeight: 33
                })

            }
        }
    }
}
