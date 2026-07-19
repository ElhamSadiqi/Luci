pragma Singleton

import QtQuick

QtObject {

    readonly property color background: "#000000"

    readonly property color textPrimary: "#E5E7EB"
    readonly property color textSecondary: "#9CA3AF"

    readonly property color icon: "#9CA3AF"

    readonly property color accent: "#E5E7EB"

    readonly property int clockSpacing: 2

    readonly property int capsuleRadius: 23

    readonly property int leftSectionWidth: 130
    readonly property int rightSectionWidth: 90

    readonly property int outerPadding: 16

    readonly property int capsulePadding: 14
    readonly property int sectionGap: 0

    readonly property int fastAnimation: 180
    readonly property int normalAnimation: 220
}
