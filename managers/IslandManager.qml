pragma Singleton

import QtQuick

QtObject {
    readonly property int defaultMode: 0
    readonly property int overlayMode: 1
    readonly property int expandedMode: 2

    property int mode: defaultMode
}
