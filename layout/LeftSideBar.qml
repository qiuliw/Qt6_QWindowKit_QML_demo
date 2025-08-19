import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QPlayer

Rectangle {
    id: sidebar
    color: Theme.currentTheme.sidebarBackgroundColor

    ScrollView {
        id: scrollArea
        anchors.fill: parent
        clip: true

        // 自定义竖直滚动条
        ScrollBar.vertical: ScrollBar {
            id: vbar
            policy: ScrollBar.AsNeeded
            width: 6
            visible: hovered || active
            opacity: hovered || active ? 0.8 : 0.0
            Behavior on opacity { NumberAnimation { duration: 200 } }

            contentItem: Rectangle {
                radius: 3
                color: "#aaaaaa"
            }
        }

        ColumnLayout {
            id: columnLayout
            spacing: 10
            anchors.fill: parent
            
            Rectangle {
                // 布局内宽度要用Layout.preferredWidth
                Layout.preferredWidth : parent.width
                // width: parent.width
                height: 40
                Text{
                    text: "QPlayer"
                    anchors.centerIn: parent
                    font.pointSize: 20
                    font.bold: true
                    color: Theme.currentTheme.logoFontColor
                }
            }

            // Repeater {
            //     model: sidebarModel
            //     delegate: Rectangle {
            //         width: 40
            //     }
            // }
        }


    }
}
