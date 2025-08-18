import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QWindowKit 1.0
import QtQuick.Layouts 1.15
import QPlayer 1.0

import './layout' // 一个模块的文件会被放到同级目录下，可以直接引用

Window {
    property bool showWhenReady: true
    id: window
    width: 1010
    height: 710
    color: "#4e4ee9ff"
    title: qsTr("QPlayer")
    Component.onCompleted: {
        windowAgent.setup(window)
        windowAgent.setWindowAttribute("dark-mode", true)
        if (window.showWhenReady) {
            window.visible = true
        }
    }

    // QWindowKit窗口代理
    WindowAgent {
        id: windowAgent
    }

    // 左侧边栏
    LeftSideBar {
        id: sidebar
        width: 200
        anchors {
            top: parent.top
            bottom: bottomBar.top
            left: parent.left
        }
    }

    // 顶部栏 - 与 qwindowskit耦合，难抽为组件
    Rectangle {
        id: titleBar
        anchors {
            top: parent.top
            left: sidebar.right
            right: parent.right
        }
        height: 60
        color: Theme.currentTheme.titleBarBackgroundColor

        // 此组件创建时，将此组件与 qwindowskit 绑定，标题栏事件由此传入
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
                        color: minButton.hovered ? Theme.currentTheme.windowBottonHoverColor : "transparent"
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
                        color: maxButton.hovered ? Theme.currentTheme.windowBottonHoverColor : "transparent"
                        // border.color: maxButton.hovered ? "#CCCCCC" : "transparent"
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
                        color: closeButton.hovered ? Theme.currentTheme.windowBottonHoverColor : "transparent"
                        radius: 2
                    }
                    onClicked: window.close()
                    Component.onCompleted: windowAgent.setSystemButton(WindowAgent.Close, closeButton)
                }
            }
        }
    }

    // 主体内容区域
    MainContent {
        id: mainContent
        anchors {
            top: titleBar.bottom
            left: sidebar.right
            right: parent.right
            bottom: bottomBar.top
        }

    }

    // 底部栏
    BottomBar {
        id: bottomBar
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: 60
    }
}