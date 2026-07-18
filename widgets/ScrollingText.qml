import QtQuick

Item {
    id: root

    property string text: ""
    property int maxWidth: 100
    property int fontSize: 13

    width: maxWidth
    implicitHeight: label.implicitHeight

    clip: true

    Text {
        id: label

        text: root.text

        color: "white"

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: root.fontSize
        font.bold: true

        anchors.verticalCenter: parent.verticalCenter

        x: 0
    }


    SequentialAnimation {
        id: scrollAnimation

        loops: Animation.Infinite

        PauseAnimation {
            duration: 2000
        }

        NumberAnimation {
            target: label
            property: "x"

            to: -(label.width - root.maxWidth)

            duration: 8000

            easing.type: Easing.Linear
        }

        PauseAnimation {
            duration: 2000
        }

        NumberAnimation {
            target: label
            property: "x"

            to: 0

            duration: 8000

            easing.type: Easing.Linear
        }
    }


    function shouldScroll() {
        return label.width > root.maxWidth + 20
    }


    onTextChanged: {
        scrollAnimation.stop()

        label.x = 0

        if (shouldScroll()) {
            scrollAnimation.start()
        }
    }


    Component.onCompleted: {
        if (shouldScroll()) {
            scrollAnimation.start()
        }
    }
}
