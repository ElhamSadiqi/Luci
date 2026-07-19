import QtQuick

import "../widgets"

Item {
    implicitWidth: 520
    implicitHeight: 75

    Row {
        anchors.fill: parent

        anchors.leftMargin: 14
        anchors.rightMargin: 14

        spacing: 0

        LeftSection {
            width: 130

            anchors.verticalCenter: parent.verticalCenter
        }

        Item {
            width: 520 - 130 - 90 - 28
            height: parent.height

            CenterSection {
                expanded: true

                anchors.centerIn: parent
            }
        }

        RightSection {
            width: 90

            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
