cmake_minimum_required(VERSION 3.16)

project(QPlayer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

list(APPEND CMAKE_PREFIX_PATH "D:/Software/qwindowkit/install/lib/cmake")
# Set module path for custom find scripts
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# Find Qt first
find_package(Qt6 6.2 COMPONENTS Core Gui Qml Quick REQUIRED)

# Find QWindowKit
find_package(QWindowKit REQUIRED)

qt_add_executable(${PROJECT_NAME}
    main.cpp
)

qt_add_qml_module(${PROJECT_NAME} # 默认导入项目的
    URI QPlayer
    VERSION 1.0
    QML_FILES 
        main.qml
        FramelessWindow.qml
        QWKButton.qml
        layout/MainContent.qml
        layout/BottomBar.qml
        layout/LeftSideBar.qml
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

# Copy QWindowKit runtime DLLs to the target directory
if(COMMAND qwindowkit_copy_runtime)
    qwindowkit_copy_runtime(${PROJECT_NAME})
endif()