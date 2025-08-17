import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle{
    // 使用ColumnLayout组织左侧边栏内容
    ColumnLayout {
        id: sidebarLayout
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 10
        }
        spacing: 5

        // 顶部Logo区域
        Rectangle {
            id: sidebarTop
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            color: "transparent"

            // 软件名
            Text {
                anchors.centerIn: parent
                // text: window.title
                font.pixelSize: 32
                font.bold: true
                color: "#cba6f7"
            }
        }

        // 菜单分隔线
        Rectangle {
            Layout.preferredHeight: 1
            Layout.fillWidth: true
            color: "#444444"
        }

        // 主要菜单项
        // 发现音乐
        Rectangle {
            id: discoverMusicItem
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            // color: darkStyle.menuItemBackgroundColor
            radius: 5

            Text {
                anchors.centerIn: parent
                text: qsTr("发现音乐")
                color: "#FFFFFF"
                font.pixelSize: 14
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                // onEntered: parent.color = darkStyle.menuItemHoverColor
                // onExited: parent.color = darkStyle.menuItemBackgroundColor
                onClicked: console.log("发现音乐 clicked")
            }
        }

        // 我的音乐
        Rectangle {
            id: myMusicItem
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            color: "transparent"

            Text {
                anchors.centerIn: parent
                text: qsTr("我的音乐")
                color: "#CCCCCC"
                font.pixelSize: 14
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                // onEntered: parent.color = darkStyle.menuItemHoverColor
                onExited: parent.color = "transparent"
                onClicked: console.log("我的音乐 clicked")
            }
        }

        // 朋友
        Rectangle {
            id: friendsItem
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            color: "transparent"

            Text {
                anchors.centerIn: parent
                text: qsTr("朋友")
                color: "#CCCCCC"
                font.pixelSize: 14
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                // onEntered: parent.color = darkStyle.menuItemHoverColor
                onExited: parent.color = "transparent"
                onClicked: console.log("朋友 clicked")
            }
        }

        // 商城
        Rectangle {
            id: mallItem
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            color: "transparent"

            Text {
                anchors.centerIn: parent
                text: qsTr("商城")
                color: "#CCCCCC"
                font.pixelSize: 14
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                // onEntered: parent.color = darkStyle.menuItemHoverColor
                onExited: parent.color = "transparent"
                onClicked: console.log("商城 clicked")
            }
        }

        // 音乐人
        Rectangle {
            id: musicianItem
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            color: "transparent"

            Text {
                anchors.centerIn: parent
                text: qsTr("音乐人")
                color: "#CCCCCC"
                font.pixelSize: 14
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                // onEntered: parent.color = darkStyle.menuItemHoverColor
                onExited: parent.color = "transparent"
                onClicked: console.log("音乐人 clicked")
            }
        }

        // 下载管理
        Rectangle {
            id: downloadItem
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            color: "transparent"

            Text {
                anchors.centerIn: parent
                text: qsTr("下载管理")
                color: "#CCCCCC"
                font.pixelSize: 14
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                // onEntered: parent.color = darkStyle.menuItemHoverColor
                onExited: parent.color = "transparent"
                onClicked: console.log("下载管理 clicked")
            }
        }

        // 我的收藏
        Rectangle {
            id: favoriteItem
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            color: "transparent"

            Text {
                anchors.centerIn: parent
                text: qsTr("我的收藏")
                color: "#CCCCCC"
                font.pixelSize: 14
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = darkStyle.menuItemHoverColor
                onExited: parent.color = "transparent"
                onClicked: console.log("我的收藏 clicked")
            }
        }

        // 本地音乐
        Rectangle {
            id: localMusicItem
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            color: "transparent"

            Text {
                anchors.centerIn: parent
                text: qsTr("本地音乐")
                color: "#CCCCCC"
                font.pixelSize: 14
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = darkStyle.menuItemHoverColor
                onExited: parent.color = "transparent"
                onClicked: console.log("本地音乐 clicked")
            }
        }

        // 博客
        Rectangle {
            id: blogItem
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            color: "transparent"

            Text {
                anchors.centerIn: parent
                text: qsTr("博客")
                color: "#CCCCCC"
                font.pixelSize: 14
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = darkStyle.menuItemHoverColor
                onExited: parent.color = "transparent"
                onClicked: console.log("博客 clicked")
            }
        }

        // 创建的歌单标题
        Text {
            Layout.topMargin: 20
            Layout.fillWidth: true
            text: qsTr("创建的歌单")
            color: "#AAAAAA"
            font.pixelSize: 12
        }

        // 创建的歌单列表项
        Rectangle {
            Layout.preferredHeight: 30
            Layout.fillWidth: true
            color: "transparent"

            RowLayout {
                anchors.fill: parent
                spacing: 10

                Text {
                    text: "▷"
                    color: "#AAAAAA"
                    font.pixelSize: 12
                }

                Text {
                    text: qsTr("我喜欢的音乐")
                    color: "#CCCCCC"
                    font.pixelSize: 12
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = darkStyle.menuItemHoverColor
                onExited: parent.color = "transparent"
                onClicked: console.log("我喜欢的音乐 clicked")
            }
        }

        Rectangle {
            Layout.preferredHeight: 30
            Layout.fillWidth: true
            color: "transparent"

            RowLayout {
                anchors.fill: parent
                spacing: 10

                Text {
                    text: "▷"
                    color: "#AAAAAA"
                    font.pixelSize: 12
                }

                Text {
                    text: qsTr("私人FM")
                    color: "#CCCCCC"
                    font.pixelSize: 12
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = darkStyle.menuItemHoverColor
                onExited: parent.color = "transparent"
                onClicked: console.log("私人FM clicked")
            }
        }

        Rectangle {
            Layout.preferredHeight: 30
            Layout.fillWidth: true
            color: "transparent"

            RowLayout {
                anchors.fill: parent
                spacing: 10

                Text {
                    text: "▷"
                    color: "#AAAAAA"
                    font.pixelSize: 12
                }

                Text {
                    text: qsTr("摇滚音乐")
                    color: "#CCCCCC"
                    font.pixelSize: 12
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = darkStyle.menuItemHoverColor
                onExited: parent.color = "transparent"
                onClicked: console.log("摇滚音乐 clicked")
            }
        }
    }
}