import QtQuick
import "../styles"

Rectangle {
    id: root

    property string icon: ""
    property string title: ""

    radius: height / 2 

    color: "#1A1A1A"

    implicitHeight: 32
    implicitWidth: row.implicitWidth + 16

    opacity: visible ? 1 : 0
    property real chipScale: visible ? 1.0 : 0.94

    scale: chipScale
    
    Behavior on scale {
       NumberAnimation {
          duration: 180
          easing.type: Easing.OutCubic
        }
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 180
            easing.type: Easing.OutCubic
        }
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 180
            easing.type: Easing.OutCubic
        }
    }

    Row {
        id: row

        anchors.centerIn: parent

        spacing: 6

        Text {
            text: root.icon

            color: Theme.textPrimary
            font.family: "JetBrainsMono Nerd Font"
            font.pixelSize: 13
        }

        Text {
            text: root.title

            color: Theme.textPrimary
            font.pixelSize: 12
            font.weight: Font.Medium
        }

        Behavior on opacity {
           NumberAnimation {
              duration: 120
           }
        }
    }
}
