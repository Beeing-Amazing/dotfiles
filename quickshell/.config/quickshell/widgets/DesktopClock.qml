import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

ShellRoot {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: w

            property var modelData
            screen: modelData

            property string fontFamily: "CaskaydiaCove Nerd Font Mono"
            property int weight: 900
            property int timeSize: 44
            property int dateSize: 24
            property int lineSpacing: -8


            anchors {
                right: true
                bottom: true
            }

            margins {
                right: 100
                bottom: 40
            }

            implicitWidth: content.width
            implicitHeight: content.height

            color: "transparent"
            mask: Region {}
            WlrLayershell.layer: WlrLayer.Bottom

            property string currentTime: ""
            property string currentDate: ""

            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: {
                    let now = new Date()
                    currentTime = Qt.formatTime(now, "hh:mm")
                    currentDate = Qt.formatDate(now, "ddd dd/MM")
                }
                Component.onCompleted: triggered()
            }

            ColumnLayout {
                id: content
                spacing: w.lineSpacing

                Text {
                    text: w.currentTime
                    color: "#95ffffff"
                    font.family: w.fontFamily
                    font.weight: w.weight
                    font.pointSize: w.timeSize
                }

                Text {
                    text: w.currentDate
                    color: "#95ffffff"
                    font.family: w.fontFamily
                    font.weight: w.weight
                    font.pointSize: w.dateSize
                }
            }
        }
    }
}
