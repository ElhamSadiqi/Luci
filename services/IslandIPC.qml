import Quickshell
import Quickshell.Io
import "../managers"

IpcHandler {
    target: "luci"

    function openPowerMenu() {
        IslandManager.setMode(IslandManager.powerMenuMode)
    }

    function openExpandedHome() {
        IslandManager.setMode(IslandManager.expandedMode)
    }

    function reset() {
        IslandManager.reset()
    }

    function openWallpaperSelector() {
        IslandManager.setMode(IslandManager.wallpaperSelectorMode)
    }

    function openThemeSelector() {
        IslandManager.setMode(IslandManager.themeSelectorMode)
    }

}
