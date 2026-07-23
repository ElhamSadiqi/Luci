import Quickshell
import "windows"
import "services"

ShellRoot {

    StatusWatcher {}
    WorkspaceService {}
    KeyboardService {}

    IslandIPC {}

    IslandWindow {}
}
