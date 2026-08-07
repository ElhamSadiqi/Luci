import QtQuick

import "../styles"
import "../managers"

Item {
    id: root

    property bool interactive: true

    implicitWidth: Theme.leftSectionWidth
    implicitHeight: nowPlaying.implicitHeight

    NowPlayingWidget {
        id: nowPlaying

        anchors.left: parent.left
        anchors.leftMargin: Theme.sectionGap
        anchors.verticalCenter: parent.verticalCenter
    }

    HoverHandler {
        enabled: root.interactive
        cursorShape: Qt.PointingHandCursor
    }

    TapHandler {
        enabled: root.interactive

        acceptedButtons: Qt.LeftButton
        gesturePolicy: TapHandler.ReleaseWithinBounds

        onTapped: function(event) {

            event.accepted = true

            IslandManager.ignoreNextIslandTap = false

            IslandManager.returnToExpanded =
                IslandManager.islandPinned

            IslandManager.islandPinned = false

            IslandManager.setMode(
                IslandManager.mediaControlsMode
            )
        }
    }
}