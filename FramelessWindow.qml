import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt.labs.platform 1.1
import QWindowKit 1.0
import QtQuick.Layouts 1.15

Window {
    property bool showWhenReady: true

    id: window
    width: 1010
    height: 710
    color: darkStyle.windowBackgroundColor
    title: qsTr("QWindowKit QtQuick Demo")
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
        readonly property color windowBackgroundColor: "#2F0000"
    }
    QtObject {
        id: darkStyle
        readonly property color windowBackgroundColor: "#1E1E1E"
        readonly property color sidebarBackgroundColor: "#2F2F2F"
        readonly property color mainViewBackgroundColor: "#1E1E1E"
        readonly property color bottomBarBackgroundColor: "#2F2F2F"
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

    // 顶部栏
    Rectangle {
        id: titleBar
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        height: 32
        color: "transparent"
        Component.onCompleted: windowAgent.setTitleBar(titleBar)

        // 软件名
        Text {
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 10
            }
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: window.title
            font.pixelSize: 14
            color: "#ECECEC"
        }
        // 窗口按钮
        Row {
            anchors {
                top: parent.top
                right: parent.right
            }
            height: parent.height

            QWKButton {
                id: minButton
                height: parent.height
                source: "qrc:/QWKExample/resources/window-bar/minimize.svg"
                onClicked: window.showMinimized()
                Component.onCompleted: windowAgent.setSystemButton(WindowAgent.Minimize, minButton)
            }

            QWKButton {
                id: maxButton
                height: parent.height
                source: window.visibility === Window.Maximized ? "qrc:/QWKExample/resources/window-bar/restore.svg" : "qrc:/QWKExample/resources/window-bar/maximize.svg"
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
                height: parent.height
                source: "qrc:/QWKExample/resources/window-bar/close.svg"
                background: Rectangle {
                    color: {
                        if (!closeButton.enabled) {
                            return "gray";
                        }
                        if (closeButton.pressed) {
                            return "#e81123";
                        }
                        if (closeButton.hovered) {
                            return "#e81123";
                        }
                        return "transparent";
                    }
                }
                onClicked: window.close()
                Component.onCompleted: windowAgent.setSystemButton(WindowAgent.Close, closeButton)
            }
        }
    }

    // 主体内容区域
    Rectangle {
        id: mainContent
        anchors {
            top: titleBar.bottom
            left: parent.left
            right: parent.right
            bottom: bottomBar.top
        }
        color: "transparent"

        // 使用 Row 布局组织左侧边栏和右侧主视图
        Row {
            anchors.fill: parent

            // 左侧边栏
            Rectangle {
                id: sidebar
                width: 200
                height: parent.height
                color: darkStyle.sidebarBackgroundColor

                Column {
                    anchors {
                        top: parent.top
                        left: parent.left
                        right: parent.right
                        margins: 10
                    }
                    spacing: 15

                    Rectangle {
                        width: parent.width
                        height: 40
                        color: "#3F3F3F"
                        radius: 5

                        Text {
                            anchors.centerIn: parent
                            text: qsTr("发现音乐")
                            color: "#FFFFFF"
                            font.pixelSize: 14
                        }
                    }

                    Rectangle {
                        width: parent.width
                        height: 40
                        color: "transparent"

                        Text {
                            anchors.centerIn: parent
                            text: qsTr("我的音乐")
                            color: "#CCCCCC"
                            font.pixelSize: 14
                        }
                    }

                    Rectangle {
                        width: parent.width
                        height: 40
                        color: "transparent"

                        Text {
                            anchors.centerIn: parent
                            text: qsTr("朋友")
                            color: "#CCCCCC"
                            font.pixelSize: 14
                        }
                    }

                    Rectangle {
                        width: parent.width
                        height: 40
                        color: "transparent"

                        Text {
                            anchors.centerIn: parent
                            text: qsTr("商城")
                            color: "#CCCCCC"
                            font.pixelSize: 14
                        }
                    }

                    Rectangle {
                        width: parent.width
                        height: 40
                        color: "transparent"

                        Text {
                            anchors.centerIn: parent
                            text: qsTr("音乐人")
                            color: "#CCCCCC"
                            font.pixelSize: 14
                        }
                    }
                }
            }

            // 右侧主视图
            Rectangle {
                id: mainView
                width: parent.width - sidebar.width
                height: parent.height
                color: darkStyle.mainViewBackgroundColor

                // 主视图内容
                Column {
                    anchors {
                        fill: parent
                        margins: 20
                    }
                    spacing: 20

                    Text {
                        text: qsTr("推荐歌单")
                        color: "#FFFFFF"
                        font {
                            pixelSize: 20
                            bold: true
                        }
                    }

                    // 使用 GridView 实现自适应布局
                    GridView {
                        id: songGridView
                        width: parent.width
                        height: parent.height - 40 // 减去标题高度
                        cellWidth: 170
                        cellHeight: 220
                        model: 20 // 增加更多项目以测试换行效果
                        
                        // 添加移动动画
                        displaced: Transition {
                            NumberAnimation { 
                                properties: "x,y" 
                                duration: 400
                                easing.type: Easing.OutCubic
                            }
                        }
                        
                        // 根据窗口宽度动态调整列数
                        onWidthChanged: {
                            var columns = Math.max(1, Math.floor(width / 170));
                            cellWidth = Math.max(150, (width - spacing * (columns - 1)) / columns);
                        }

                        delegate: Rectangle {
                            id: songItem
                            width: songGridView.cellWidth - 20
                            height: songGridView.cellHeight - 20
                            color: "#2F2F2F"
                            radius: 8

                            // 添加进入动画
                            opacity: 0
                            Behavior on opacity {
                                NumberAnimation { duration: 300 }
                            }
                            Component.onCompleted: {
                                opacity = 1
                            }

                            Column {
                                anchors {
                                    fill: parent
                                    margins: 10
                                }
                                spacing: 10

                                Rectangle {
                                    width: parent.width
                                    height: 130
                                    color: "#3F3F3F"
                                    radius: 5
                                }

                                Text {
                                    text: qsTr("歌单 ") + (index + 1)
                                    color: "#FFFFFF"
                                    font.pixelSize: 14
                                    elide: Text.ElideRight
                                }

                                Text {
                                    text: qsTr("描述信息...")
                                    color: "#AAAAAA"
                                    font.pixelSize: 12
                                    elide: Text.ElideRight
                                }
                            }
                        }
                    }
                }
            }
        }
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