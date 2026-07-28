# Luci

Luci is a minimalist Dynamic Island built with Quickshell for Hyprland.

Unlike many desktop shell projects that try to replace every part of your desktop, Luci focuses on doing a few things well. It provides quick access to the features you use every day while staying lightweight, keyboard-friendly, and easy to extend.

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


## Design Philosophy

Luci was built around a few simple ideas:

- Keep the interface small and distraction-free.
- Prefer keyboard navigation over complex menus.
- Make every feature modular.
- Avoid unnecessary dependencies.
- Keep the codebase easy to read and extend.

Luci is not intended to replace your desktop environment. It simply provides a clean, lightweight control center for everyday interactions.

## Project Structure

```text
Luci/
├── assets/
│   └── wallpapers.json
├── components/
├── config/
│   └── hypr/            # Example Hyprland configuration
├── managers/
├── scripts/
├── services/
├── styles/
│   ├── Theme.qml
│   └── themes/
│       ├── catppuccin/
│       ├── monochrome/
│       └── ...
├── views/
├── widgets/
├── windows/
├── shell.qml
└── ARCHITECTURE.md
```

| Directory | Purpose |
|-----------|---------|
| `assets/` | Static assets and wallpaper metadata. |
| `components/` | Shared UI building blocks. |
| `config/` | Example Hyprland configuration required for optional integrations. |
| `managers/` | Global state and island navigation. |
| `scripts/` | Helper shell scripts (theme switching, brightness, volume, wallpapers). |
| `services/` | System integrations such as media, battery, Wi-Fi, wallpapers, themes, and IPC. |
| `styles/` | Global styling and built-in themes. |
| `views/` | Individual pages displayed inside the island. |
| `widgets/` | Reusable UI widgets used across multiple views. |
| `windows/` | Top-level Quickshell windows. |

## Installation

### 1. Clone the repository

```bash
cd ~/.config
git clone https://github.com/ElhamSadiqi/Luci.git quickshell
```

### 2. Launch Luci

Start Luci with:

```bash
qs -c ~/.config/quickshell & disown
```

At this point, Luci is fully functional as a standalone Quickshell shell. The Dynamic Island, media controls, status widgets, clock, and other core components will work without any Hyprland configuration.

### 3. Optional Hyprland Integration

Some features are designed to be launched through Hyprland keybindings rather than appearing automatically.

These include:

* Theme Selector
* Wallpaper Selector
* Power Menu

To use these views, add your own keybindings to your Hyprland configuration (`hyprland.conf` or `hyprland.lua`).

The repository includes an example configuration under:

```text
config/hypr/
```

which demonstrates how these keybindings are wired into Luci.

### 4. Theme Switching

Luci's theme switcher also updates Hyprland colors.

To support this, your Hyprland configuration should be modular, similar to the example provided in `config/hypr/`. The supplied example separates appearance and theme-related configuration into dedicated modules, allowing the theme switcher to update only the files it needs without modifying the rest of your configuration.

If you prefer not to use the provided Hyprland structure, Luci will still run normally—you'll simply lose automatic Hyprland theme synchronization.

## Configuration

Luci is designed to be easy to customize. Wallpapers, themes, and Hyprland integration are intentionally kept simple so you can adapt the project to your own workflow without modifying the core code.

### Wallpaper Metadata

Luci uses `assets/wallpapers.json` to organize wallpapers by theme.

Each theme contains a list of wallpapers that should appear when the **Theme** filter is selected inside the wallpaper selector.

Example:

```json
[
  {
    "theme": "rosepine",
    "files": [
      "night-city.jpg",
      "girl-car.png",
      "sleeping.jpg"
    ]
  }
]
```

The wallpaper selector has two modes:

* **Theme** — Displays only the wallpapers assigned to the currently active theme.
* **All** — Displays every wallpaper found inside `~/Pictures/wallpapers`.

This allows every theme to have its own curated wallpaper collection while still giving you access to your complete wallpaper library whenever you need it.

### Adding Wallpapers

Adding your own wallpapers is straightforward.

1. Copy your wallpapers into:

```text
~/Pictures/wallpapers
```

2. Open `assets/wallpapers.json`.

3. Add the wallpaper filename under the theme you want it to appear in.

Example:

```json id="x6feg4"
{
  "theme": "rosepine",
  "files": [
    "night-city.jpg",
    "girl-car.png",
    "my-new-wallpaper.png"
  ]
}
```

4. Restart Luci (or reload the wallpaper service).

The wallpaper will now appear under both:

* **All** — because it exists in `~/Pictures/wallpapers`
* **Theme** — if it is listed under the currently active theme in `wallpapers.json`

### Creating a New Theme

Luci's theming system is directory-based. Every theme lives inside its own folder and contains everything needed for both Luci and the applications it integrates with.

A typical theme looks like this:

```text id="5n9fr7"
styles/themes/
└── mytheme/
    ├── Theme.qml
    ├── HyprTheme.lua
    └── kitty.conf
```

Each file has a specific purpose:

* **Theme.qml** — Defines Luci's colors, accents, borders, buttons, and UI styling.
* **HyprTheme.lua** — Defines the colors used by Hyprland.
* **kitty.conf** — Applies the same color palette to Kitty, keeping the terminal consistent with the rest of the desktop.

To create a new theme, simply duplicate an existing theme folder, rename it, and modify the files to match your desired color palette.

### Customizing `Theme.qml`

`Theme.qml` controls the appearance of Luci. Every built-in theme contains one, and every visual element in the interface reads its colors from this file.

Some of the most commonly customized properties include:

| Property             | Purpose                                                  |
| -------------------- | -------------------------------------------------------- |
| `background`         | Main window background color.                            |
| `surface`            | Cards and panels.                                        |
| `accent`             | Primary accent color used for selections and highlights. |
| `textPrimary`        | Main text color.                                         |
| `textSecondary`      | Secondary text color.                                    |
| `border`             | Default border color.                                    |
| `buttonBackground`   | Default button color.                                    |
| `buttonHover`        | Button hover state.                                      |
| `buttonSelected`     | Active/selected button color.                            |
| `wallpaperSelection` | Border color around the selected wallpaper.              |

Once the file is saved, simply reload Luci to see the changes.

Every built-in widget uses these shared properties, allowing the entire interface to stay visually consistent without modifying individual components.

### Hyprland Theme Integration

Luci can synchronize its color palette with Hyprland.

Each theme includes a `HyprTheme.lua` file that defines the colors used by your Hyprland configuration.

When you switch themes inside Luci, the selected `HyprTheme.lua` is linked into your Hyprland configuration through:

```text id="6rrqjj"
config/hypr/current-theme/theme.lua
```

Your Hyprland configuration can then import this file and use its variables for borders, shadows, active/inactive window colors, and other appearance settings.

This approach keeps Luci and Hyprland using the same color palette while avoiding duplicated configuration across multiple files.

If you don't want Hyprland integration, simply ignore this file—Luci will continue to function normally.

### Keybindings

Luci does not register any keybindings on its own.

Views such as the Theme Selector, Wallpaper Selector, and Power Menu are intended to be opened through your Hyprland configuration.

The repository includes an example configuration under:

```text id="jv1r1m"
config/hypr/
```

Use it as a reference for integrating Luci into your own setup.

For example:

| Action             | Example Keybinding |
| ------------------ | ------------------ |
| Theme Selector     | `SUPER + T`        |
| Wallpaper Selector | `SUPER + W`        |
| Power Menu         | `SUPER + P`        |

You are free to choose any keybindings that fit your workflow.

Luci only provides the views—the method used to launch them is entirely up to your Hyprland configuration.

## Developer Guide

Luci follows a modular architecture where every component has a single responsibility.

Instead of placing all logic in one file, functionality is separated into services, managers, views, widgets, and styling modules. This makes the project easier to maintain and extend over time.

The project is organized as follows:

| Directory     | Purpose                                                                |
| ------------- | ---------------------------------------------------------------------- |
| `components/` | Shared reusable QML components.                                        |
| `managers/`   | Controls navigation and high-level application state.                  |
| `services/`   | Background services that provide system information and functionality. |
| `views/`      | Individual pages shown inside the Dynamic Island.                      |
| `widgets/`    | Small reusable UI elements used by multiple views.                     |
| `styles/`     | Theme definitions and shared styling.                                  |
| `scripts/`    | Helper scripts used by services.                                       |
| `assets/`     | Static project resources such as wallpaper metadata.                   |

Each module is designed to be as independent as possible, making it straightforward to replace existing functionality or add new features without affecting unrelated parts of the project.

### Project Structure

Luci is organized into small, focused modules. Each directory has a single responsibility, making the project easier to understand and extend.

```text id="k4d9qp"
Luci/
├── assets/
├── components/
├── config/
├── managers/
├── scripts/
├── services/
├── styles/
├── views/
├── widgets/
├── windows/
└── shell.qml
```

| Directory     | Description                                                     |
| ------------- | --------------------------------------------------------------- |
| `assets/`     | Static resources such as wallpaper metadata.                    |
| `components/` | Shared reusable QML components.                                 |
| `config/`     | Example Hyprland configuration for integrating Luci.            |
| `managers/`   | Handles application state and navigation.                       |
| `scripts/`    | Shell scripts used by various services.                         |
| `services/`   | Background services that communicate with the operating system. |
| `styles/`     | Theme definitions and shared styling.                           |
| `views/`      | Individual pages shown inside the Dynamic Island.               |
| `widgets/`    | Small reusable UI components shared across views.               |
| `windows/`    | Top-level application windows.                                  |
| `shell.qml`   | Entry point of the project.                                     |


### Architecture

Luci follows a layered architecture where each layer has a single responsibility.

```
User Input
     │
     ▼
Managers
     │
     ▼
Views
     │
     ▼
Widgets
     │
     ▼
Services
     │
     ▼
System (Hyprland, Playerctl, NetworkManager, brightnessctl, etc.)
```

The general flow is:

* **Managers** decide *what* should be displayed.
* **Views** describe complete interfaces such as the Default View, Theme Selector, or Wallpaper Selector.
* **Widgets** are reusable building blocks shared between multiple views.
* **Services** provide live system information and expose functions to the rest of the application.
* **Scripts** are used only when a service needs to interact with external programs.

This separation keeps the UI independent from the system logic. A widget never needs to know how battery information is collected, and a service never needs to know how that information is displayed.

### Managers

Managers coordinate the behavior of Luci. Unlike services, they do not collect system information. Instead, they control which views are shown and how different parts of the interface interact.

#### IslandManager

`IslandManager` is responsible for switching between the different views displayed inside the Dynamic Island.

For example, it controls transitions between:

* Default View
* Expanded View
* Theme Selector
* Wallpaper Selector
* Power Menu

Instead of each view opening itself, every transition goes through the `IslandManager`, keeping navigation centralized and predictable.

#### StatusManager

`StatusManager` controls the status chips shown around the island.

It determines which chips are visible, updates their order, and manages temporary status indicators without requiring each individual service to modify the interface directly.

Keeping this logic separate allows services to focus on providing data while managers focus on presenting it.

### Services

Services are the backbone of Luci.

Each service is responsible for one specific task. Rather than placing all system logic in one file, Luci separates functionality into small, independent services that expose data and functions to the rest of the application.

Views and widgets never communicate directly with the operating system—they communicate with services instead.

Current services include:

| Service            | Responsibility                                          |
| ------------------ | ------------------------------------------------------- |
| `BatteryService`   | Battery level, charging state, and related information. |
| `CavaService`      | Audio visualizer data.                                  |
| `IslandIPC`        | Communication between external commands and Luci.       |
| `KeyboardService`  | Keyboard layout and input state.                        |
| `MediaService`     | Media playback information using Playerctl.             |
| `PowerService`     | Shutdown, reboot, suspend, and logout actions.          |
| `StatusWatcher`    | Watches and updates status chips.                       |
| `ThemeService`     | Loads and applies themes throughout Luci.               |
| `WallpaperService` | Wallpaper management and theme-aware filtering.         |
| `WifiService`      | Wireless connection status.                             |
| `WorkspaceService` | Active workspace information from Hyprland.             |

Each service is designed to be independent. A service should perform one task well and expose only the data needed by the interface.

This makes it easy to add, remove, or replace functionality without affecting unrelated parts of the project.

### Views

Views represent complete interfaces inside Luci.

Unlike widgets, which are small reusable components, a view is responsible for an entire screen or interaction.

Current views include:

| View                    | Purpose                                                                       |
| ----------------------- | ----------------------------------------------------------------------------- |
| `DefaultView`           | The default Dynamic Island layout shown during normal use.                    |
| `ExpandedView`          | Displays additional system and media information when the island is expanded. |
| `ClockView`             | Shows the current time.                                                       |
| `DateView`              | Displays the current date.                                                    |
| `OverlayView`           | Temporary overlay used for status feedback.                                   |
| `PowerMenuView`         | Provides shutdown, reboot, suspend, and logout options.                       |
| `ThemeSelectorView`     | Allows switching between installed themes.                                    |
| `WallpaperSelectorView` | Lets the user browse and apply wallpapers, including theme-aware filtering.   |

Views are intentionally lightweight. They focus on layout and user interaction while relying on services to provide data.

A view should never be responsible for querying system information directly. Instead, it consumes data exposed by one or more services and presents it to the user.

### Widgets

Widgets are reusable user interface components used throughout Luci.

Instead of duplicating UI code across multiple views, common elements are implemented once as widgets and reused wherever needed.

Some of the built-in widgets include:

| Widget             | Purpose                                                     |
| ------------------ | ----------------------------------------------------------- |
| `WallpaperCard`    | Displays a wallpaper preview inside the wallpaper selector. |
| `ThemeCard`        | Displays a theme preview inside the theme selector.         |
| `NowPlayingWidget` | Shows the currently playing media.                          |
| `AlbumArt`         | Displays album artwork provided by the media service.       |
| `SongInfo`         | Displays song title and artist information.                 |
| `MiniCava`         | Compact audio visualizer.                                   |
| `PowerOption`      | Individual power menu button.                               |
| `ScrollingText`    | Displays long text with automatic scrolling.                |
| `LeftSection`      | Left side of the Dynamic Island layout.                     |
| `CenterSection`    | Center portion of the Dynamic Island.                       |
| `RightSection`     | Right side of the Dynamic Island layout.                    |

Widgets are designed to be completely reusable. A widget should focus only on presentation and interaction while receiving all required data from its parent view or from a service.

This separation keeps the codebase modular and makes it easy to reuse the same component in multiple places without duplication.

### Adding a New Service

Adding new functionality to Luci usually starts by creating a service.

A service should have a single responsibility. For example:

* Weather
* Bluetooth
* VPN status
* CPU usage
* RAM usage

Create a new file inside the `services/` directory:

```text id="j0m6rf"
services/
└── WeatherService.qml
```

A service should:

* Expose properties that other components can read.
* Update its own data.
* Provide functions when actions need to be performed.
* Avoid containing user interface code.

Once created, the service can be imported by any view or widget that needs it.

The recommended flow is:

```text id="4i4v8k"
Operating System
        │
        ▼
New Service
        │
        ▼
View
        │
        ▼
Widget
```

Keeping services independent makes them easy to maintain, test, and reuse throughout the project.

### Adding a New View

Views are responsible for displaying complete interfaces inside Luci.

To create a new view, add a QML file inside the `views/` directory:

```text id="q2y8nk"
views/
└── WeatherView.qml
```

A view should:

* Arrange the layout of the interface.
* Handle user interaction.
* Read data from one or more services.
* Compose reusable widgets when possible.
* Avoid implementing system logic directly.

After creating the view, register it with the appropriate manager (typically `IslandManager`) so it can be opened like the existing Theme Selector, Wallpaper Selector, or Power Menu.

A typical workflow is:

```text id="e6v3rm"
Create Service
      │
      ▼
Create View
      │
      ▼
Register View
      │
      ▼
Open from a Keybinding or Manager
```

Keeping navigation centralized through the managers makes it easy to add new functionality without modifying unrelated views.

### Adding a New Widget

Widgets are reusable building blocks used throughout Luci.

If you find yourself copying the same UI into multiple views, it should probably become a widget.

Create a new file inside the `widgets/` directory:

```text id="8g3vxm"
widgets/
└── WeatherCard.qml
```

A widget should:

* Focus on a single visual component.
* Receive data through properties.
* Avoid containing business or system logic.
* Be reusable across multiple views.

For example, a `WeatherCard` could be used in:

* The Default View
* The Expanded View
* A dedicated Weather View

without duplicating any interface code.

A typical hierarchy inside Luci looks like this:

```text id="2l7kqs"
Service
   │
   ▼
View
   │
   ├── Widget
   ├── Widget
   ├── Widget
   └── Widget
```

Keeping widgets small and reusable helps maintain consistency across the interface while making future changes significantly easier.

## Roadmap

Luci intentionally has a small roadmap.

The current plans are:

* 🎛️ Control Center
* 🚀 Application Launcher
* ✨ General polish, bug fixes, and quality-of-life improvements

The goal is to improve the existing experience rather than continuously adding new features.

## Contributing

Contributions are always welcome, whether it's bug fixes, documentation improvements, performance optimizations, or code cleanup.

That said, Luci has a clear design philosophy:

* Keep it simple.
* Keep it lightweight.
* Build features that solve real problems.

The goal is **not** to add widgets simply because they look cool or because other desktop shells have them.

Every new feature increases maintenance complexity, memory usage, and startup time. Before adding something new, ask yourself:

* Does this improve everyday usability?
* Does it fit Luci's minimalist philosophy?
* Would most users actually use it?

If the answer is no, it probably doesn't belong in Luci.

The objective is to build a clean, responsive shell that stays fast and focused—not to become a feature-complete desktop environment.

