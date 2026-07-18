import QtQuick
import "../styles"

Item {
    implicitWidth: Theme.leftSectionWidth
    implicitHeight: nowPlaying.implicitHeight

    NowPlayingWidget {
        id: nowPlaying

        anchors.left: parent.left
        anchors.leftMargin: Theme.sectionGap
        anchors.verticalCenter: parent.verticalCenter
    }
}
