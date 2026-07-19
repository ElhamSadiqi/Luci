pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    Process {
        id: commandProcess

        onExited: function(exitCode, exitStatus) {
            console.log("Exited:", exitCode)
        }
    }

    function run(cmd) {
        commandProcess.command = cmd
        commandProcess.running = true
    }


    function lock() {
        run([
            "loginctl",
            "lock-session"
        ])
    }


    function suspend() {
        run(
            ["systemctl", "suspend"],
            []
        )
    }


    function reboot() {
        run(
            ["systemctl", "reboot"],
            []
        )
    }


    function poweroff() {
        run(
            ["systemctl", "poweroff"],
            []
        )
    }
}
