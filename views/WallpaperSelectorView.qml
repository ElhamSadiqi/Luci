import QtQuick
import Qt.labs.folderlistmodel

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

    property int selectedIndex: 0

    property int columns: 3

    Column {

        anchors.fill: parent

        anchors.margins: 10

        spacing: 20

        // ====================================
        // Header
        // ====================================

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

        // ====================================
        // Scrollable wallpaper area
        // ====================================

        Flickable {

            id: wallpaperArea

            Component.onCompleted: {
                console.log("Flickable created")
            }

            focus: true

            width: parent.width
            height: 340

            clip: true

            interactive: false
            boundsBehavior: Flickable.StopAtBounds

            contentWidth: wallpaperGrid.width
            contentHeight: wallpaperGrid.height

            Grid {

                id: wallpaperGrid

                anchors.left: parent.left
                anchors.leftMargin: 10
                
                columns: root.columns

                spacing: 16

                Repeater {

                    model: WallpaperService.wallpapers

                    WallpaperCard {

                        imageSource: model.path

                        selected: index === root.selectedIndex
                    }
                }
            }
        }

        // ====================================
        // Bottom buttons
        // ====================================

        Row {

            anchors.horizontalCenter: parent.horizontalCenter

            spacing: 12

            Rectangle {

                width: 110
                height: 36

                radius: 12

                color: Theme.accent

                border.width: 1
                border.color: Theme.borderSubtle

                Text {

                    anchors.centerIn: parent

                    text: "Theme"

                    color: Theme.buttonText

                    font.pixelSize: 13

                    font.bold: true
                }
            }

            Rectangle {

                width: 110
                height: 36

                radius: 12

                border.color: Theme.border

                border.width: 1

                Text {

                    anchors.centerIn: parent

                    text: "All"

                    color: Theme.textPrimary

                    font.pixelSize: 13
                }
            }
        }
    }

    Keys.onPressed: function(event) {
        console.log("KEY:", event.key)

        switch (event.key) {

        // ==========================
        // LEFT
        // ==========================

        case Qt.Key_Left:
        case Qt.Key_H:

            if (selectedIndex % columns > 0)
                selectedIndex--

            event.accepted = true
            break


        // ==========================
        // RIGHT
        // ==========================

        case Qt.Key_Right:
        case Qt.Key_L:

            if (selectedIndex % columns < columns - 1 &&
                selectedIndex < WallpaperService.wallpapers.count - 1)

                selectedIndex++

            event.accepted = true
            break


        // ==========================
        // UP
        // ==========================

        case Qt.Key_Up:
        case Qt.Key_K:

            if (selectedIndex - columns >= 0)
                selectedIndex -= columns

            event.accepted = true
            break


        // ==========================
        // DOWN
        // ==========================

        case Qt.Key_Down:
        case Qt.Key_J:

            if (selectedIndex + columns < WallpaperService.wallpapers.count)
                selectedIndex += columns

            event.accepted = true
            break


        // ==========================
        // ENTER
        // ==========================

        case Qt.Key_Return:
        case Qt.Key_Enter:

            WallpaperService.apply(
                WallpaperService.wallpapers.get(selectedIndex).path
            )

            event.accepted = true
            break

        // ==========================
        // ESC
        // ==========================

        case Qt.Key_Escape:

            IslandManager.reset()

            event.accepted = true
            break
        }

        // ======================================
        // Keep selected wallpaper visible
        // ======================================

        Qt.callLater(function() {

            var row = Math.floor(selectedIndex / columns)

            var cardHeight = 116      // 100px card + 16px spacing

            var y = row * cardHeight

            if (y < wallpaperArea.contentY)
                wallpaperArea.contentY = y

            else if (y + cardHeight >
                    wallpaperArea.contentY + wallpaperArea.height)

                wallpaperArea.contentY =
                        y + cardHeight - wallpaperArea.height
        })
    }
}