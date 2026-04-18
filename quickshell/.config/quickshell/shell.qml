/* quickshell/shell.qml */

import Quickshell
import QtQuick
import "./themes"


ShellRoot {
    ThemeLoader {}

    Loader {
        id: clockLoader
        active: true
        source: "widgets/DesktopClock.qml"
    }
}

