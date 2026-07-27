---------------------
---- KEYBINDINGS ----
---------------------

local programs = require("core.programs")

local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(programs.terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(programs.menu))

hl.bind(mainMod .. " + P",
    hl.dsp.exec_cmd("qs ipc call luci openPowerMenu"))

hl.bind(mainMod .. " + W",
    hl.dsp.exec_cmd("qs ipc call luci openWallpaperSelector"))

hl.bind(mainMod .. " + V",
    hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + T",
    hl.dsp.exec_cmd("qs ipc call luci openThemeSelector"))

hl.bind(mainMod .. " + B",
    hl.dsp.exec_cmd("mkdir /tmp/zen_lock 2>/dev/null && (zen-browser; rmdir /tmp/zen_lock)"))

hl.bind(mainMod .. " + period",
    hl.dsp.exec_cmd("rofi -show emoji"))

hl.bind(mainMod .. " + H",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))

hl.bind(mainMod .. " + S",
    hl.dsp.exec_cmd("hyprshot -m window"))

hl.bind(mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd("hyprshot -m region"))

hl.bind(mainMod .. " + L",
    hl.dsp.exec_cmd("hyprlock"))
    
hl.bind(mainMod .. " + F",
    hl.dsp.window.fullscreen())

hl.bind(mainMod .. " + N",
    hl.dsp.exec_cmd("swaync-client -t"))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10

    hl.bind(mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i }))

    hl.bind(mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true })

hl.bind(mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true })

hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("~/.config/quickshell/scripts/volume.sh up"),
    { locked = true, repeating = true })

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("~/.config/quickshell/scripts/volume.sh down"),
    { locked = true, repeating = true })

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("~/.config/quickshell/scripts/volume.sh mute"),
    { locked = true })

hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("~/.config/quickshell/scripts/brightness.sh +5%"),
    { locked = true, repeating = true })

hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("~/.config/quickshell/scripts/brightness.sh 5%-"),
    { locked = true, repeating = true })

hl.bind("XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true })

hl.bind("XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true })

hl.bind("XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true })

hl.bind("XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true })

hl.config({
    binds = {
        drag_threshold = 10 -- Correctly placed inside the binds category
    }
})

-- Move floating windows with mainMod + Left Click drag
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- Resize floating windows with mainMod + Right Click drag (from corners/edges)
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
    
hl.bind(mainMod .. " + CTRL + left",
    hl.dsp.window.resize({
        x = -40,
        y = 0,
        relative = true,
    }))

hl.bind(mainMod .. " + CTRL + right",
    hl.dsp.window.resize({
        x = 40,
        y = 0,
        relative = true,
    }))

hl.bind(mainMod .. " + CTRL + up",
    hl.dsp.window.resize({
        x = 0,
        y = -40,
        relative = true,
    }))

hl.bind(mainMod .. " + CTRL + down",
    hl.dsp.window.resize({
        x = 0,
        y = 40,
        relative = true,
    }))
