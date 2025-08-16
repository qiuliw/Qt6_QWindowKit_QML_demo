project(WidgetFrame)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

file(GLOB _src *.h *.cpp)

add_library(${PROJECT_NAME} STATIC ${_src})

target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_17)

target_link_libraries(${PROJECT_NAME} 
    Qt::Core 
    Qt::Gui 
    Qt::Widgets
)

target_include_directories(${PROJECT_NAME} PUBLIC . ..)