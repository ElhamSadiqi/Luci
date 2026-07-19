pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    Process {
        id: commandProcess
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

    function logout() {
        run([
            "hyprctl",
            "dispatch",
            "exit"
        ])
    }

    function suspend() {
        run([
            "systemctl",
            "suspend"
        ])
    }

    function reboot() {
        run([
            "systemctl",
            "reboot"
        ])
    }

    function poweroff() {
        run([
            "systemctl",
            "poweroff"
        ])
    }
}
