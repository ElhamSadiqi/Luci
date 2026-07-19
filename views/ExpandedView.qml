import QtQuick

import "../styles"
import "../views"

Column {

    spacing: Theme.clockSpacing

    Row {
        ClockView { }
    }

    DateView { }
}
