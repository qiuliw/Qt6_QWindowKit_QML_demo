pragma Singleton
import QtQuick 2.15
import Qt.labs.settings 1.1

Item {

    // 配置存储，后续也可以存储在服务器数据库中
    Settings {
        id: settings
        category: "Theme"
        property string mode: "default"   // "default" or "custom"
        property int defaultIndex: 0
        property var customThemes: []     // 保存多个自定义主题
        property int customIndex: -1      // 当前使用的自定义主题下标
    }

    // 默认主题
    property var defaultThemes: [
        {
            name: "Light",
            fontColor: "#572920",
            windowBackgroundColor: "#b812ffff",            
            sidebarBackgroundColor: "#00e463ff",
            bottomBarBackgroundColor: "#ffe9e9ff",
            titleBarBackgroundColor: "#901212ff",

            windowBottonHoverColor: "#4646460a",

        },
        {
            name: "Dark",
            windowBackgroundColor: "#1e1e2e",
            fontColor: "#ffffff",
        },
        {
            name: "Blue",
            windowBackgroundColor: "#eaf2ff",
            fontColor: "#1c3d6e",
        }
    ]

    // 当前主题（对外唯一暴露接口）
    property var currentTheme: defaultThemes[defaultIndex]

    // 初始化时加载配置
    Component.onCompleted: {
        if (settings.mode === "custom" && settings.customThemes.length > 0) {
            setCustomTheme(settings.customIndex)
        } else {
            setDefaultTheme(settings.defaultIndex)
        }
    }

    // 设置默认主题
    function setDefaultTheme(index) {
        if (index >= 0 && index < defaultThemes.length) {
            currentTheme = defaultThemes[index]
            settings.mode = "default"
            settings.defaultIndex = index
            settings.customIndex = -1
        }
    }

    // 添加自定义主题
    function addCustomTheme(themeData) {
        settings.customThemes.push(themeData)
        setCustomTheme(settings.customThemes.length - 1)
    }

    // 切换自定义主题
    function setCustomTheme(index) {
        if (index >= 0 && index < settings.customThemes.length) {
            currentTheme = settings.customThemes[index]
            settings.mode = "custom"
            settings.customIndex = index
        }
    }

    // 删除自定义主题
    function removeCustomTheme(index) {
        if (index >= 0 && index < settings.customThemes.length) {
            settings.customThemes.splice(index, 1)
            if (settings.customIndex === index) {
                // 如果删掉的是当前主题，回退到第一个默认主题
                setDefaultTheme(0)
            }
        }
    }

    // 重置为默认 Light
    function resetToDefault() {
        setDefaultTheme(0)
    }
}
