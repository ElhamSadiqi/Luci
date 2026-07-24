import QtQuick

import "../widgets"
import "../managers"
import "../services"
import "../styles"

FocusScope {
    id: root

    implicitWidth: 550
    implicitHeight: 420

    focus: true

    property int selectedIndex: 0
    property int columns: 3

    Component.onCompleted: forceActiveFocus()

    Column {

        anchors.fill: parent
        anchors.margins: 10

        spacing: 20

        // ==========================================
        // Header
        // ==========================================

        Item {

            width: parent.width
            height: 30

            Text {

                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter

                text: "Themes"

                font.pixelSize: 20

                color: Theme.textPrimary
            }

            Text {

                anchors.right: parent.right
                anchors.rightMargin: 15
                anchors.verticalCenter: parent.verticalCenter

                text: ThemeService.themes.count + " Themes"

                font.pixelSize: 13

                color: Theme.textSecondary
            }
        }

        // ==========================================
        // Scrollable Theme Area
        // ==========================================

        Flickable {

            id: themeArea

            width: parent.width

            height: 340

            clip: true

            interactive: false

            boundsBehavior: Flickable.StopAtBounds


            contentWidth: themeGrid.width

            contentHeight: themeGrid.height


            Grid {

                id: themeGrid

                anchors.left: parent.left

                anchors.leftMargin: 10

                columns: root.columns

                spacing: 16


                Repeater {

                    model: ThemeService.themes


                    ThemeCard {

                        themeName: model.name

                        backgroundColor: model.background

                        color1: model.color1
                        color2: model.color2
                        color3: model.color3

                        accentColor: model.accent

                        textColor: model.text

                        selected: index === root.selectedIndex
                    }
                }
            }
        }
    }

    Keys.onPressed: function(event) {

        switch (event.key) {

        case Qt.Key_Left:
        case Qt.Key_H:

            if (selectedIndex % columns > 0)
                selectedIndex--

            event.accepted = true
            break


        case Qt.Key_Right:
        case Qt.Key_L:

            if (selectedIndex % columns < columns - 1 &&
                selectedIndex < ThemeService.themes.count - 1)

                selectedIndex++

            event.accepted = true
            break


        case Qt.Key_Up:
        case Qt.Key_K:

            if (selectedIndex - columns >= 0)
                selectedIndex -= columns

            event.accepted = true
            break


        case Qt.Key_Down:
        case Qt.Key_J:

            if (selectedIndex + columns < ThemeService.themes.count)
                selectedIndex += columns

            event.accepted = true
            break


        case Qt.Key_Return:
        case Qt.Key_Enter:

            ThemeService.apply(
                ThemeService.themes.get(selectedIndex).themeId
            )

            event.accepted = true
            break


        case Qt.Key_Escape:

            IslandManager.reset()

            event.accepted = true
            break
        }


        // ======================================
        // Keep selected theme visible
        // ======================================

        Qt.callLater(function() {

            var row = Math.floor(selectedIndex / columns)

            var cardHeight = 114   // 100px card + 16px spacing

            var y = row * cardHeight


            if (y < themeArea.contentY)

                themeArea.contentY = y


            else if (
                y + cardHeight >
                themeArea.contentY + themeArea.height
            )

                themeArea.contentY =
                    y + cardHeight - themeArea.height
        })
    }
}
