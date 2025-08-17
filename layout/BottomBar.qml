import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item{
        // 底部栏
    Rectangle {

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