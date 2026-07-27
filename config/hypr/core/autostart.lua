-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("qs -c ~/.config/quickshell")

    -- hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("hypridle")

    hl.exec_cmd([[bash -c "wl-paste --type text --watch cliphist store"]])

    hl.exec_cmd(
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland"
    )

    hl.exec_cmd(
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
    )

    hl.exec_cmd("/usr/lib/xdg-desktop-portal -r -v")
end)
