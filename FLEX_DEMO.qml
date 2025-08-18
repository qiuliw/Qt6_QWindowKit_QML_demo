import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    width: 1000
    height: 800
    visible: true
    title: "Flexbox 全场景 QML 实现"

    ScrollView {
        anchors.fill: parent
        ColumnLayout {
            id: rootCol
            width: parent.width
            spacing: 20

            /* 1. flex-direction: row */
            GroupBox {
                title: qsTr("1. row（主轴水平）")
                Layout.fillWidth: true
                RowLayout {
                    anchors { fill: parent; margins: 10 }
                    Rectangle { color: "tomato"; width: 50; height: 40 }
                    Rectangle { color: "lime"; Layout.fillWidth: true; height: 40 }   // flex-grow:1
                    Rectangle { color: "skyblue"; width: 50; height: 40 }
                }
            }

            /* 2. flex-direction: column */
            GroupBox {
                title: qsTr("2. column（主轴竖直）")
                Layout.fillWidth: true
                ColumnLayout {
                    anchors { fill: parent; margins: 10 }
                    Rectangle { color: "tomato"; width: 40; height: 30 }
                    Rectangle { color: "lime"; Layout.fillHeight: true; width: 40 }   // flex-grow:1
                    Rectangle { color: "skyblue"; width: 40; height: 30 }
                }
            }
            /* 3. flex-wrap: wrap —— 保证 Flow 能看到换行 */
            GroupBox {
                title: qsTr("3. flex-wrap: wrap（Flow 自动换行）")
                Layout.fillWidth: true
                Flow {
                    spacing: 8
                    width: parent.width          // 让它知道可用宽度
                    // 关键：根据内容算高度，否则 0×0
                    onChildrenChanged: Qt.callLater(()=> {
                        height = childrenRect.height
                    })
                    Repeater {
                        model: 15
                        Rectangle {
                            width: 100
                            height: 40
                            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                        }
                    }
                }
            }

            /* 4. justify-content: space-between */
            GroupBox {
                title: qsTr("4. justify-content: space-between")
                Layout.fillWidth: true
                RowLayout {
                    anchors { fill: parent; margins: 10 }
                    Rectangle { color: "orange"; width: 80; height: 40 }
                    Item { Layout.fillWidth: true }   // spacer
                    Rectangle { color: "violet"; width: 80; height: 40 }
                }
            }

            /* 5. justify-content: center */
            GroupBox {
                title: qsTr("5. justify-content: center")
                Layout.fillWidth: true
                RowLayout {
                    anchors { fill: parent; margins: 10 }
                    Item { Layout.fillWidth: true }
                    Rectangle { color: "red"; width: 80; height: 40 }
                    Rectangle { color: "green"; width: 80; height: 40 }
                    Item { Layout.fillWidth: true }
                }
            }

            /* 6. align-items: flex-start / center / flex-end */
            GroupBox {
                title: qsTr("6. align-items")
                Layout.fillWidth: true
                Rectangle {
                    Layout.preferredHeight: 120
                    Layout.fillWidth: true
                    color: "#eee"
                    RowLayout {
                        anchors { fill: parent; margins: 10 }
                        Rectangle { color: "red";   width: 60; height: 40; Layout.alignment: Qt.AlignTop }
                        Rectangle { color: "green"; width: 60; height: 40; Layout.alignment: Qt.AlignVCenter }
                        Rectangle { color: "blue";  width: 60; height: 40; Layout.alignment: Qt.AlignBottom }
                    }
                }
            }

            /* 7. min-width / max-width / preferredWidth */
            GroupBox {
                title: qsTr("7. min/max/preferredWidth")
                Layout.fillWidth: true
                RowLayout {
                    anchors { fill: parent; margins: 10 }
                    Rectangle {
                        color: "red"; height: 40
                        Layout.minimumWidth: 50
                        Layout.preferredWidth: 120
                        Layout.maximumWidth: 200
                    }
                    Rectangle { color: "green"; Layout.fillWidth: true; height: 40 }
                }
            }

            /* 8. flex-shrink */
            GroupBox {
                title: qsTr("8. flex-shrink")
                Layout.fillWidth: true
                RowLayout {
                    anchors { fill: parent; margins: 10 }
                    Rectangle { color: "pink";  Layout.preferredWidth: 400; height: 40; Layout.fillWidth: true }
                    Rectangle { color: "cyan";  Layout.preferredWidth: 400; height: 40; Layout.fillWidth: true }
                    Rectangle { color: "yellow";Layout.preferredWidth: 400; height: 40; Layout.fillWidth: true }
                }
            }

            /* 9. flex-basis */
            GroupBox {
                title: qsTr("9. flex-basis")
                Layout.fillWidth: true
                RowLayout {
                    anchors { fill: parent; margins: 10 }
                    Rectangle { color: "red";  Layout.preferredWidth: 80; height: 40 }
                    Rectangle { color: "green";Layout.preferredWidth: 160; height: 40 }
                    Rectangle { color: "blue"; Layout.preferredWidth: 80; height: 40 }
                }
            }

            /* 10. order */
            GroupBox {
                title: qsTr("10. order")
                Layout.fillWidth: true
                RowLayout {
                    anchors { fill: parent; margins: 10 }
                    Rectangle { color: "red";   width: 50; height: 40; z: 3; Layout.row: 2 }
                    Rectangle { color: "green"; width: 50; height: 40; z: 1; Layout.row: 0 }
                    Rectangle { color: "blue";  width: 50; height: 40; z: 2; Layout.row: 1 }
                }
            }

            /* 11. align-content: space-around / space-evenly / stretch */
            GroupBox {
                title: qsTr("11. align-content（space-around）")
                Layout.fillWidth: true
                Rectangle {
                    Layout.preferredHeight: 160
                    Layout.fillWidth: true
                    color: "#eee"
                    GridLayout {
                        anchors.centerIn: parent
                        columns: 3
                        columnSpacing: 20
                        rowSpacing: 10
                        Repeater {
                            model: 6
                            Rectangle { width: 80; height: 30; color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1) }
                        }
                    }
                }
            }

            /* 12. 内容撑开父容器 */
            GroupBox {
                title: qsTr("12. 内容撑开父容器")
                Layout.fillWidth: true
                Row {
                    spacing: 10
                    Layout.fillWidth: true
                    Rectangle { width: 50; height: 40; color: "pink" }
                    Rectangle { width: 100; height: 40; color: "cyan" }
                    Rectangle { width: 150; height: 40; color: "yellow" }
                }
            }

            /* 13. 自适应等分（flex: 1） */
            GroupBox {
                title: qsTr("13. 等分（flex: 1）")
                Layout.fillWidth: true
                RowLayout {
                    anchors { fill: parent; margins: 10 }
                    Rectangle { color: "red";   Layout.fillWidth: true; height: 40 }
                    Rectangle { color: "green"; Layout.fillWidth: true; height: 40 }
                    Rectangle { color: "blue";  Layout.fillWidth: true; height: 40 }
                }
            }

            
        }
    }
}