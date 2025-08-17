import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QWindowKit 1.0
import QtQuick.Layouts 1.15

Window {
    property bool showWhenReady: true

    id: window
    width: 1010
    height: 710
    color: darkStyle.windowBackgroundColor
    title: qsTr("QPlayer")
    Component.onCompleted: {
        windowAgent.setup(window)
        windowAgent.setWindowAttribute("dark-mode", true)
        if (window.showWhenReady) {
            window.visible = true
        }
    }

    // 主题颜色
    QtObject {
        id: lightStyle
        readonly property color windowBackgroundColor: "#1e1e2e"
        readonly property color sidebarBackgroundColor: "#181825" 
        readonly property color mainViewBackgroundColor: "#1e1e2e"
        readonly property color bottomBarBackgroundColor: "#11111b"
        readonly property color menuItemBackgroundColor: "#313244"
        readonly property color menuItemHoverColor: "#45475a"
        readonly property color titleBarBackgroundColor: "#11111b"
    }
    QtObject {
        id: darkStyle
        readonly property color windowBackgroundColor: "#1e1e2e"
        readonly property color sidebarBackgroundColor: "#181825"
        readonly property color mainViewBackgroundColor: "#1e1e2e"
        readonly property color bottomBarBackgroundColor: "#11111b"
        readonly property color menuItemBackgroundColor: "#313244"
        readonly property color menuItemHoverColor: "#45475a"
    }

    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: timeLabel.text = Qt.formatTime(new Date(), "hh:mm:ss")
    }

    WindowAgent {
        id: windowAgent
    }

    // 左侧边栏
    Rectangle {
        id: sidebar
        width: 200
        anchors {
            top: parent.top
            bottom: bottomBar.top
            left: parent.left
        }
        color: lightStyle.sidebarBackgroundColor

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
                    text: window.title
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
                color: darkStyle.menuItemBackgroundColor
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
                    onEntered: parent.color = darkStyle.menuItemHoverColor
                    onExited: parent.color = darkStyle.menuItemBackgroundColor
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
                    onEntered: parent.color = darkStyle.menuItemHoverColor
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
                    onEntered: parent.color = darkStyle.menuItemHoverColor
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
                    onEntered: parent.color = darkStyle.menuItemHoverColor
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
                    onEntered: parent.color = darkStyle.menuItemHoverColor
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
                    onEntered: parent.color = darkStyle.menuItemHoverColor
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

    // 顶部栏 - 不再依赖QWindowKit
    Rectangle {
        id: titleBar
        anchors {
            top: parent.top
            left: sidebar.right
            right: parent.right
        }
        height: 60
        color: lightStyle.titleBarBackgroundColor
        Component.onCompleted: windowAgent.setTitleBar(titleBar)

        // 内边距容器
        Item {
            anchors.fill: parent
            anchors.margins: 20
            
            // 窗口按钮
            Row {
                anchors {
                    right: parent.right // 靠右
                    verticalCenter: parent.verticalCenter // 内容居中
                }
                spacing: 5

                QWKButton {
                    id: minButton
                    width: 30
                    height: 30
                    source: "qrc:/QPlayer/resources/window-bar/minimize.svg"
                    background: Rectangle {
                        color: "transparent"
                        border.color: minButton.hovered ? "#CCCCCC" : "transparent"
                        radius: 2
                    }
                    onClicked: window.showMinimized()
                    Component.onCompleted: windowAgent.setSystemButton(WindowAgent.Minimize, minButton)
                }

                QWKButton {
                    id: maxButton
                    width: 30
                    height: 30
                    source: window.visibility === Window.Maximized ? "qrc:/QPlayer/resources/window-bar/restore.svg" : "qrc:/QPlayer/resources/window-bar/maximize.svg"
                    background: Rectangle {
                        color: "transparent"
                        border.color: maxButton.hovered ? "#CCCCCC" : "transparent"
                        radius: 2
                    }
                    onClicked: {
                        if (window.visibility === Window.Maximized) {
                            window.showNormal()
                        } else {
                            window.showMaximized()
                        }
                    }
                    Component.onCompleted: windowAgent.setSystemButton(WindowAgent.Maximize, maxButton)
                }

                QWKButton {
                    id: closeButton
                    width: 30
                    height: 30
                    source: "qrc:/QPlayer/resources/window-bar/close.svg"
                    background: Rectangle {
                        color: "transparent"
                        border.color: closeButton.hovered ? "#e81123" : "transparent"
                        radius: 2
                    }
                    onClicked: window.close()
                    Component.onCompleted: windowAgent.setSystemButton(WindowAgent.Close, closeButton)
                }
            }
        }
    }

    // 主体内容区域
    Rectangle {
        id: mainContent
        anchors {
            top: titleBar.bottom
            left: sidebar.right
            right: parent.right
            bottom: bottomBar.top
        }
        color: "transparent"

    }

    // 底部栏
    Rectangle {
        id: bottomBar
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: 60
        color: darkStyle.bottomBarBackgroundColor

        // 使用 Row 布局组织底部栏内容
        Row {
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }
            spacing: 20
            layoutDirection: Qt.LeftToRight

            // 音乐封面
            Rectangle {
                width: 40
                height: 40
                color: "#3F3F3F"
            }

            // 音乐信息和控制按钮
            Column {
                spacing: 5
                Layout.alignment: Qt.AlignVCenter

                Text {
                    text: qsTr("歌曲名称")
                    color: "#FFFFFF"
                    font.pixelSize: 14
                }

                Text {
                    text: qsTr("歌手名称")
                    color: "#AAAAAA"
                    font.pixelSize: 12
                }

                // 控制按钮
                Row {
                    spacing: 15

                    Text {
                        text: "◀◀"
                        color: "#FFFFFF"
                        font.pixelSize: 14
                    }

                    Text {
                        text: "▶"
                        color: "#FFFFFF"
                        font.pixelSize: 14
                    }

                    Text {
                        text: "▶▶"
                        color: "#FFFFFF"
                        font.pixelSize: 14
                    }
                }
            }

            // 进度条
            Item {
                width: Math.max(100, parent.width * 0.3) // 最小宽度100
                height: 40
                Layout.fillWidth: true

                Rectangle {
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                        right: parent.right
                    }
                    height: 4
                    color: "#555555"
                    radius: 2

                    Rectangle {
                        width: parent.width * 0.3
                        height: parent.height
                        color: "#1DB954"
                        radius: 2
                    }
                }
            }

            // 音量控制和其他按钮
            Row {
                spacing: 15
                Layout.alignment: Qt.AlignVCenter

                Text {
                    text: "🔊"
                    color: "#FFFFFF"
                    font.pixelSize: 14
                }

                Text {
                    text: "☰"
                    color: "#FFFFFF"
                    font.pixelSize: 14
                }

                Text {
                    text: "❤"
                    color: "#FFFFFF"
                    font.pixelSize: 14
                }
            }
        }
    }
}