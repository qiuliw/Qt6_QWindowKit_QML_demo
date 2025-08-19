cmake_minimum_required(VERSION 3.16)

project(QPlayer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 设置所有配置的输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)  # 可执行文件和Windows DLL
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)  # Linux/macOS 动态库
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)  # 静态库

add_subdirectory(cmake)

find_package(Qt6 6.2 COMPONENTS Core Gui Qml Quick REQUIRED)

qt_add_executable(${PROJECT_NAME}
    main.cpp
)

set_source_files_properties(layout/Theme.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(${PROJECT_NAME} # 默认导入项目的
    URI QPlayer
    VERSION 1.0
    QML_FILES 
        main.qml
        FramelessWindow.qml
        layout/Theme.qml
        layout/MainContent.qml
        layout/BottomBar.qml
        layout/LeftSideBar.qml
        components/QWKButton.qml

    RESOURCES
        resources/window-bar/close.svg
        resources/window-bar/fullscreen.svg
        resources/window-bar/maximize.svg
        resources/window-bar/minimize.svg
        resources/window-bar/restore.svg
        resources/window-bar/more-line.svg
        resources/window-bar/pin.svg
        resources/window-bar/pin-fill.svg
        resources/app/example.png
)


target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_17)

# Link libraries
target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt6::Core
    PRIVATE Qt6::Gui
    PRIVATE Qt6::Qml
    PRIVATE Qt6::Quick
    PRIVATE QWindowKit::Quick
)

qt_deploy_runtime(${PROJECT_NAME})