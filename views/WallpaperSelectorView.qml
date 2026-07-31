import QtQuick
import Qt.labs.folderlistmodel
import QtQuick.Controls 2.15

import "../widgets"
import "../managers"
import "../services"
import "../styles"

FocusScope {
    id: root

    Component.onCompleted: {
        forceActiveFocus()
    }

    implicitWidth: 550
    implicitHeight: 460

    focus: true

    property int selectedIndex: wallpaperView.currentIndex

    property int columns: 3

    Column {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 20

        Item {

            width: parent.width
            height: 30

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.verticalCenter: parent.verticalCenter

                text: "Wallpapers"

                font.pixelSize: 20

                color: Theme.textPrimary
            }

            Text {

                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.verticalCenter: parent.verticalCenter

                text: ThemeService.currentTheme

                font.pixelSize: 13

                color: Theme.textSecondary
            }
        }

        GridView {

            id: wallpaperView

            width: parent.width
            height: 340

            contentItem.x: 15

            clip: true

            interactive: true
            boundsBehavior: Flickable.StopAtBounds

            keyNavigationEnabled: true
            focus: true

            cellWidth: (width - 32) / columns
            cellHeight: 116

            model: WallpaperService.currentModel

            delegate: Item {

                width: wallpaperView.cellWidth
                height: wallpaperView.cellHeight

                WallpaperCard {

                    anchors {
                        left: parent.left
                        right: parent.right
                        leftMargin: 8
                        rightMargin: 8
                        top: parent.top
                    }

                    height: 100

                    imageSource: model.path

                    selected: index === wallpaperView.currentIndex
                }

                MouseArea {

                    anchors.fill: parent

                    onClicked: {

                        wallpaperView.currentIndex = index

                        WallpaperService.apply(model.path)
                    }
                }
            }

            ScrollBar.vertical: ScrollBar {

                policy: ScrollBar.AsNeeded
            }

            onCurrentIndexChanged: {

                Qt.callLater(function() {

                    wallpaperView.positionViewAtIndex(
                        currentIndex,
                        GridView.Center
                    )
                })
            }
        }

        Row {

            anchors.horizontalCenter: parent.horizontalCenter

            spacing: 12

            Rectangle {

                width: 110
                height: 36

                radius: 12

                color: WallpaperService.themeOnly
                    ? Theme.accent
                    : Theme.buttonBackground

                border.width: 1
                border.color: Theme.border

                MouseArea {

                    anchors.fill: parent

                    onClicked: {

                        WallpaperService.setFilter(true)

                        wallpaperView.currentIndex = 0

                        wallpaperView.forceActiveFocus()
                    }
                }

                Text {

                    anchors.centerIn: parent

                    text: "Theme"

                    color: WallpaperService.themeOnly
                        ? Theme.buttonText
                        : Theme.textPrimary

                    font.pixelSize: 13
                    font.bold: true
                }
            }

            Rectangle {

                width: 110
                height: 36

                radius: 12

                color: WallpaperService.themeOnly
                    ? Theme.buttonBackground
                    : Theme.accent

                border.width: 1
                border.color: Theme.border

                MouseArea {

                    anchors.fill: parent

                    onClicked: {

                        WallpaperService.setFilter(false)

                        wallpaperView.currentIndex = 0

                        wallpaperView.forceActiveFocus()
                    }
                }

                Text {

                    anchors.centerIn: parent

                    text: "All"

                    color: WallpaperService.themeOnly
                        ? Theme.textPrimary
                        : Theme.buttonText

                    font.pixelSize: 13
                    font.bold: true
                }
            }
        }
    }

    Keys.onPressed: function(event) {
        switch (event.key) {

        case Qt.Key_Return:
        case Qt.Key_Enter:
            if (wallpaperView.currentIndex >= 0 &&
                wallpaperView.currentIndex < WallpaperService.currentModel.count) {

                var selectedItem =
                        WallpaperService.currentModel.get(
                            wallpaperView.currentIndex
                        )

                WallpaperService.apply(selectedItem.path)

                event.accepted = true
            }
            break

        case Qt.Key_Escape:
            IslandManager.reset()
            event.accepted = true
            break

        case Qt.Key_H:
            if (wallpaperView.currentIndex % columns > 0)
                wallpaperView.currentIndex--
            event.accepted = true
            break

        case Qt.Key_J:  
            if (wallpaperView.currentIndex + columns <
                    WallpaperService.currentModel.count)
                wallpaperView.currentIndex += columns
            event.accepted = true
            break

        case Qt.Key_K:  
            if (wallpaperView.currentIndex - columns >= 0)
                wallpaperView.currentIndex -= columns
            event.accepted = true
            break

        case Qt.Key_L:   
            if (wallpaperView.currentIndex % columns < columns - 1 &&
                wallpaperView.currentIndex <
                    WallpaperService.currentModel.count - 1)
                wallpaperView.currentIndex++
            event.accepted = true
            break
        }
    }
}
