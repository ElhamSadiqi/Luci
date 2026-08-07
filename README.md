# Luci

Luci is a minimalist Dynamic Island built with Quickshell for Hyprland.

Unlike many desktop shell projects that aim to manage every aspect of the desktop, Luci focuses on a small set of everyday interactions. It provides quick access to the features you use most while remaining lightweight, keyboard-friendly, and easy to extend.

The goal is simplicity rather than feature overload.

## Features

- 🎨 Dynamic theme switching
- 🖼️ Theme-aware wallpaper selector
- 🎵 Rich media controls with waveform progress
- 🔊 Volume notifications
- ☀️ Brightness notifications
- 🔋 Battery status
- 📶 Wi-Fi status
- 📊 Real-time CAVA visualizer
- ⚡ Power menu
- ⌨️ Vim-inspired keyboard navigation
- 🧩 Modular architecture


## Requirements

Luci is developed and tested with:

- **Hyprland** 0.56.1
- **Quickshell** 0.3.0
- **Cava** (audio visualizer)
- **Awww** (wallpaper backend)
- **hyprsunset** *(optional, used for Night Light support)*

These are the versions currently used during development and testing.

> **Note:** `hyprsunset` is optional. You only need to install it if you plan to use Luci's Night Light controls.


## Installation

### 1. Clone the repository

If you already use Quickshell, it's recommended to back up your existing configuration before replacing it.

```bash
mv ~/.config/quickshell ~/.config/quickshell.backup
```

Clone Luci into your Quickshell configuration directory:

```bash
cd ~/.config
git clone https://github.com/ElhamSadiqi/Luci.git quickshell
```

---

### 2. Launch Luci

Start Luci manually:

```bash
qs -c ~/.config/quickshell & disown
```

At this point, Luci is fully functional as a standalone Quickshell shell.

The Dynamic Island, media controls, clock, status indicators, and all core components will work immediately.

> **Tip**
>
> If you're currently using Waybar at the top of your screen, you may want to stop it temporarily while testing Luci:
>
> ```bash
> pkill waybar
> ```
>
> This simply provides a cleaner preview of Luci. If your current bar is positioned elsewhere, you can safely ignore this step.

---

### 3. Configure Hyprland

Luci does not automatically register Hyprland keybindings.

Views such as the Power Menu, Wallpaper Selector, and Theme Selector are opened through Luci's IPC interface.

If you use **`hyprland.conf`**, add:

```ini
bind = mainMod, P, exec, qs ipc call luci openPowerMenu
bind = mainMod, W, exec, qs ipc call luci openWallpaperSelector
bind = mainMod, T, exec, qs ipc call luci openThemeSelector
```

If you use **`hyprland.lua`**, add:

```lua
hl.bind(mainMod .. " + P",
    hl.dsp.exec_cmd("qs ipc call luci openPowerMenu"))

hl.bind(mainMod .. " + W",
    hl.dsp.exec_cmd("qs ipc call luci openWallpaperSelector"))

hl.bind(mainMod .. " + T",
    hl.dsp.exec_cmd("qs ipc call luci openThemeSelector"))
```

---
#### Volume & Brightness Notifications

Luci displays temporary status notifications whenever your volume or brightness changes.

To enable this, route your multimedia keys through Luci's helper scripts.

If you use **`hyprland.conf`**, add:

```ini
# Volume
bindel = , XF86AudioRaiseVolume, exec, ~/.config/quickshell/scripts/volume.sh up
bindel = , XF86AudioLowerVolume, exec, ~/.config/quickshell/scripts/volume.sh down
bindl  = , XF86AudioMute, exec, ~/.config/quickshell/scripts/volume.sh mute

# Brightness
bindel = , XF86MonBrightnessUp, exec, ~/.config/quickshell/scripts/brightness.sh +5%
bindel = , XF86MonBrightnessDown, exec, ~/.config/quickshell/scripts/brightness.sh 5%-
```

If you use **`hyprland.lua`**, add:

```lua
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
```

Without these bindings, your volume and brightness keys may still function, but Luci won't receive the events required to display its status notifications.

You are free to use any keybindings that fit your workflow.

Luci only exposes the IPC commands and helper scripts—the way they are triggered is entirely up to your Hyprland configuration.

### 4. Wallpaper Backend

Luci uses **Awww** to apply wallpapers.

If you want the Wallpaper Selector to update your wallpaper, make sure the daemon is running.

If you use **`hyprland.conf`**, add:

```ini
exec-once = awww-daemon
```

If you use **`hyprland.lua`**, add:

```lua
hl.exec_cmd("awww-daemon")
```

Without the daemon, the Wallpaper Selector will still display your wallpapers, but selecting one will have no effect.

## Theme Synchronization (Optional)

By default, Luci only changes its own appearance.

If you want Luci to also update **Hyprland's appearance** (borders, gaps, rounding, blur, shadows, opacity, etc.), your Hyprland configuration **must be modular**.

Luci cannot modify a single `hyprland.conf` or `hyprland.lua` containing all of your settings.

Instead, your main `hyprland.lua` should simply load smaller modules, for example:

```lua
require("core.monitors")
require("core.env")
require("core.appearance")
require("core.keybinds")
require("core.programs")
require("core.input")
require("core.windows")
require("core.misc")
require("core.autostart")
```

A complete modular Hyprland configuration is included in:

```text
~/.config/quickshell/config/hypr/
```

If you don't already have a modular setup, simply move it to:

```text
~/.config/hypr/
```

and reload Hyprland:

```bash
hyprctl reload
```

### First Theme Switch

The first time you switch a theme from Luci, it automatically creates:

```text
~/.config/hypr/current-theme/theme.lua
```

This file is a symbolic link pointing to the currently selected theme.

Until this first theme switch happens, Hyprland may report an error because `current-theme/theme.lua` does not yet exist.

This is expected.

Simply open the Theme Selector and switch to any theme once. Luci will automatically create the required symbolic link and the error will disappear.

After that, every theme change will automatically update Hyprland's appearance.

> **Note**
>
> The `~/.config/quickshell/config/hypr/` directory is only an example configuration included with Luci.
>
> If you already have your own modular Hyprland setup, you can ignore it and integrate Luci however you prefer.
>
> If you're new to Hyprland or don't yet have a modular configuration, the provided files are intended as a complete starting point that you can copy into `~/.config/hypr/` and customize (animations, keybindings, layouts, plugins, etc.).


## Wallpaper Selector

Luci looks for wallpapers in:

```text
~/Pictures/wallpapers
```

Simply copy your wallpapers into this directory and they'll automatically appear when browsing **All** wallpapers.

### Theme Wallpapers

The **Theme Wallpapers** button is designed to make choosing wallpapers easier.

Not every wallpaper matches every color palette, so Luci allows each theme to have its own wallpaper collection. Instead of browsing every wallpaper on your system, the **Theme Wallpapers** button only shows wallpapers assigned to the currently selected theme.

Theme collections are defined in:

```text
assets/wallpapers.json
```

The repository includes the wallpaper names used on my own system. You'll likely want to replace them with your own filenames.

For example:

```json
{
  "theme": "monochrome",
  "files": [
    "monochrome1.jpg",
    "monochrome2.jpg",
    "monochrome3.jpg"
  ]
}
```

Simply replace the filenames with wallpapers that exist in your own `~/Pictures/wallpapers` directory.

### Automatic Theme Wallpapers

When switching themes, Luci can also automatically change your wallpaper.

The default wallpaper for each theme is configured in:

```text
scripts/theme.sh
```

For example:

```bash
monochrome)
    WP="monochrome1.jpg"
    ;;
```

Simply replace the filename with one of your own wallpapers.

If these files are left unchanged:

* **All** wallpapers will continue to work normally.
* The **Theme** button may not display any wallpapers for your themes.
* Automatic wallpaper switching will reference wallpaper filenames that don't exist on your system.

## Using Luci

Luci is designed around a simple interaction model. Most actions can be performed using either the keyboard or the mouse.

## Dynamic Island

When Luci starts, the Dynamic Island displays the compact clock.

### Expanding the Island

- Hover over the island to reveal the expanded view.
- Clicking an **empty area** of the expanded view toggles whether it is pinned.

When the expanded view is:

- **Pinned:** it stays open even after moving the mouse away.
- **Unpinned:** it automatically returns to the compact clock when the cursor leaves the island.

---

## Media Controls

When an MPRIS-compatible media player (such as Firefox, Spotify, VLC, etc.) is playing media, Luci makes Media Controls available from the expanded view.

To open the Media Controls:

1. Hover over the Dynamic Island to reveal the expanded view.
2. Click the **left section** of the expanded view (the Now Playing area).

The Media Controls display:

- Album artwork
- Song title and artist
- Animated waveform visualizer
- Playback progress
- Previous / Play-Pause / Next controls

## Keyboard Navigation

Luci supports Vim-inspired keyboard navigation in supported views such as the Theme Selector, Wallpaper Selector, and Power Menu.

| Action | Keys |
|--------|------|
| Move Left | **H** or **←** |
| Move Right | **L** or **→** |
| Move Up | **K** or **↑** |
| Move Down | **J** or **↓** |
| Confirm / Apply | **Enter** |
| Close View | **Esc** |

Pressing **Enter** activates the currently selected item.

For example:

- Apply a theme in the Theme Selector.
- Apply a wallpaper in the Wallpaper Selector.
- Confirm an action in the Power Menu.

## Status Notifications


Luci provides temporary notifications whenever your system volume, brightness, or workspace changes.

The behavior depends on the current state of the Dynamic Island:

- **Compact View:** the clock is temporarily replaced with the notification.
- **Expanded Bar:** the notification appears as a **Status Chip** on the right side of the island, allowing the rest of the interface to remain visible.

After a short delay, the notification automatically disappears and Luci returns to its normal state.

## Daily Driver

If you've finished testing Luci and would like it to start automatically whenever you log in, configure Hyprland to launch it during startup.

### If you use `hyprland.conf`, add:

```ini
exec-once = qs -c ~/.config/quickshell
```

### If you use `hyprland.lua`, add the following line inside your existing `hyprland.start` callback:

```lua
hl.exec_cmd("qs -c ~/.config/quickshell")
```

For example:

```lua
hl.on("hyprland.start", function()
    -- your existing startup commands

    hl.exec_cmd("qs -c ~/.config/quickshell")
end)
```

Once configured, Luci will automatically start every time you begin a Hyprland session.

If you're still experimenting or prefer running it manually, you can launch it at any time:

```bash
qs -c ~/.config/quickshell & disown
```

## License

Luci is released under the MIT License.

See the [LICENSE](LICENSE) file for the full license text.
