# Luci

Luci is a minimalist Dynamic Island built with Quickshell for Hyprland.

Unlike many desktop shell projects that aim to manage every aspect of the desktop, Luci focuses on a small set of everyday interactions. It provides quick access to the features you use most while remaining lightweight, keyboard-friendly, and easy to extend.

The goal is simplicity rather than feature overload.



## Features

- 🎨 Dynamic theme switching
- 🖼️ Theme-aware wallpaper selector
- 🎵 Media controls with album artwork
- 🔊 Volume control
- ☀️ Brightness control
- 🔋 Battery status
- 📶 Wi-Fi status
- 📊 Cava audio visualizer
- ⚡ Power menu
- ⌨️ Full keyboard navigation
- 🧩 Modular architecture

## Requirements

Luci is developed and tested with:

- **Hyprland** 0.56.0
- **Quickshell** 0.3.0
- **Cava** (audio visualizer)
- **Awww** (wallpaper backend)

Luci is tested against the versions listed above. While newer versions may work, compatibility is only guaranteed for the versions used during development.


## Design Philosophy

Luci was built around a few simple ideas:

- Keep the interface small and distraction-free.
- Prefer keyboard navigation over complex menus.
- Make every feature modular.
- Avoid unnecessary dependencies.
- Keep the codebase easy to read and extend.

Luci is not intended to replace your desktop environment. It simply provides a clean, lightweight control center for everyday interactions.

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

Views such as the Power Menu, Wallpaper Selector, and Theme Selector are opened through Hyprland using Luci's IPC interface.

Add your preferred keybindings to your Hyprland configuration.

#### Opening Luci Views

**Hyprland (.conf)**

```ini
bind = SUPER, P, exec, qs ipc call luci openPowerMenu
bind = SUPER, W, exec, qs ipc call luci openWallpaperSelector
bind = SUPER, T, exec, qs ipc call luci openThemeSelector
```

**Hyprland (Lua)**

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

Luci also displays temporary status notifications whenever your volume or brightness changes.

To enable this, route your multimedia keys through Luci's helper scripts.

**Hyprland (.conf)**

```ini
# Volume
bindel = , XF86AudioRaiseVolume, exec, ~/.config/quickshell/scripts/volume.sh up
bindel = , XF86AudioLowerVolume, exec, ~/.config/quickshell/scripts/volume.sh down
bindl  = , XF86AudioMute, exec, ~/.config/quickshell/scripts/volume.sh mute

# Brightness
bindel = , XF86MonBrightnessUp, exec, ~/.config/quickshell/scripts/brightness.sh +5%
bindel = , XF86MonBrightnessDown, exec, ~/.config/quickshell/scripts/brightness.sh 5%-
```

**Hyprland (Lua)**

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

**Hyprland (.conf)**

```ini
exec-once = awww-daemon
```

**Hyprland (Lua)**

```lua
hl.exec_cmd("awww-daemon")
```

Without the daemon, the Wallpaper Selector will still display your wallpapers, but selecting one will have no effect.


## Theme Synchronization

By default, the Theme Selector only changes Luci's appearance.

If you also want it to update your Hyprland window borders, gaps, blur, rounding, and other decoration settings, your Hyprland configuration must be modular.

An example configuration is included in:

```text
config/hypr/
```

The example demonstrates how appearance-related settings are separated into dedicated modules and loaded from the currently active theme.

If your Hyprland configuration consists of a single `hyprland.conf` or `hyprland.lua` with hardcoded values, the Theme Selector cannot update Hyprland automatically.

Luci itself will continue to change themes normally—the synchronization only affects Hyprland's appearance.

If you prefer to manage your Hyprland theme manually, you can safely ignore this integration.

## Wallpaper Selector

Luci looks for wallpapers in:

```text
~/Pictures/wallpapers
```

Simply copy your wallpapers into this directory and they'll automatically appear when browsing **All** wallpapers.

### Theme Wallpapers

The **Theme** button is designed to make choosing wallpapers easier.

Not every wallpaper matches every color palette, so Luci allows each theme to have its own wallpaper collection. Instead of browsing every wallpaper on your system, the **Theme** button only shows wallpapers assigned to the currently selected theme.

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

### Dynamic Island

When Luci starts, the Dynamic Island displays the compact clock.

- **Hover** the island to reveal the expanded bar.
- **Click** the island to pin the expanded bar open.
- **Click again** to return to the compact view.

### Keyboard Navigation

Most views support both Vim-style navigation and the arrow keys.

| Action | Keys |
| ------- | ---- |
| Move Left | `H` or `←` |
| Move Right | `L` or `→` |
| Move Up | `K` or `↑` |
| Move Down | `J` or `↓` |
| Confirm / Apply | `Enter` |

Pressing **Enter** activates the currently selected item. For example:

- Apply a theme in the **Theme Selector**
- Apply a wallpaper in the **Wallpaper Selector**
- Confirm an action in the **Power Menu**

### Mouse Support

Luci also supports mouse interaction where appropriate.

- Hover over the Dynamic Island to expand it.
- Click the Dynamic Island to pin or unpin the expanded bar.
- Scroll or click to browse and apply wallpapers in the **Wallpaper Selector**.

> **Note:** Mouse support for the Theme Selector will be added in a future update.

### Closing Views

The Power Menu, Theme Selector, and Wallpaper Selector can be closed in either of the following ways:

- Press `Esc`
- Click anywhere outside the view.

### Status Notifications

Luci provides temporary notifications whenever your system volume, brightness, or workspace changes.

The behavior depends on the current state of the Dynamic Island:

- **Compact View:** the clock is temporarily replaced with the notification.
- **Expanded Bar:** the notification appears as a **Status Chip** on the right side of the island, allowing the rest of the interface to remain visible.

After a short delay, the notification automatically disappears and Luci returns to its normal state.

## Daily Driver

If you've finished testing Luci and would like it to start automatically whenever you log in, you can configure Hyprland to launch it during startup.

### Hyprland (.conf)

```ini
exec-once = qs -c ~/.config/quickshell
```

### Hyprland (Lua)

```lua
hl.on("hyprland.start", function()
    hl.exec_cmd("qs -c ~/.config/quickshell")
end)
```

Once configured, Luci will automatically start every time you begin a Hyprland session.

If you're still experimenting or simply prefer running it manually, you can continue launching it whenever you'd like:

```bash
qs -c ~/.config/quickshell & disown
```
