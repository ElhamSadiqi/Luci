import QtQuick
import Quickshell.Widgets
import "../styles"

Rectangle {


    id: root

    property string imageSource: ""
    property bool selected: false

    width: 160
    height: 100

    radius: 16

    color: "transparent"

    layer.enabled: true
    layer.smooth: true

    ClippingRectangle {

        anchors.fill: parent

        radius: root.radius


        Image {

            anchors.fill: parent


            source: root.imageSource


            fillMode: Image.PreserveAspectCrop


            asynchronous: true

            cache: true


            smooth: true


            sourceSize.width: root.width * 2

            sourceSize.height: root.height * 2
        }
    }

    // Selection overlay

    Rectangle {

        anchors.fill: parent

        radius: root.radius

        color: selected
           ? Theme.wallpaperOverlay
           : "transparent"
    }

    // Selection outline

    Rectangle {

        anchors.fill: parent

        radius: root.radius


        color: "transparent"


        border.width: selected ? 3 : 0

        border.color: Theme.accent
    }

}
