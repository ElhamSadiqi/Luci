import QtQuick
import "../styles"

Text {
    id: date

    color: Theme.textSecondary

    font.family: "JetBrainsMono Nerd Font"
    font.pixelSize: 11

    text: Qt.formatDate(new Date(), "ddd, MMM d")

    Timer {
        interval: 60000
        running: true
        repeat: true

        onTriggered: {
            date.text = Qt.formatDate(new Date(), "ddd, MMM d")
        }
    }
}
