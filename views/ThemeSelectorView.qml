import QtQuick
import Qt.labs.folderlistmodel
import QtQuick.Controls 2.15

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

        GridView {

            id: themeView

            width: parent.width
            height: 340

            contentItem.x: 15

            clip: true

            interactive: true

            boundsBehavior: Flickable.StopAtBounds

            cellWidth: (width - 32) / root.columns
            cellHeight: 116

            model: ThemeService.themes

            currentIndex: root.selectedIndex

            delegate: Item {

                width: themeView.cellWidth
                height: themeView.cellHeight


                ThemeCard {

                    anchors.fill: parent

                    anchors.margins: 8

                    themeId: model.themeId

                    themeName: model.name

                    backgroundColor: model.background

                    color1: model.color1
                    color2: model.color2
                    color3: model.color3

                    accentColor: model.accent

                    textColor: model.text

                    selected: index === themeView.currentIndex
                }


                MouseArea {

                    anchors.fill: parent

                    cursorShape: Qt.PointingHandCursor

                    onClicked: {

                        themeView.currentIndex = index

                        ThemeService.apply(model.themeId)

                    }
                }
            }

            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AsNeeded
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
    }
}
