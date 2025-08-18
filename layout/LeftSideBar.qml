import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QPlayer 1.0

Rectangle{
    id: leftSideBar
    color: Theme.currentTheme.sidebarBackgroundColor
    // 使用ColumnLayout组织左侧边栏内容
    ColumnLayout {
        Text {
            text: "左侧边栏"
            font.pointSize: 20
            color: Theme.currentTheme.fontColor
        }
    }
}
