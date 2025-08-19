# 负责include库，索引所有头文件和库

#主cmake负责link即可

# cmakehelper/CMakeLists.txt
cmake_minimum_required(VERSION 3.16)
project(cmakehelper VERSION 1.0 LANGUAGES NONE)

include(external/qwindowkit.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/qtruntime.cmake)

function(qPlayer_add_runtime_dlls target)
    qwindowkit_copy_runtime(${target})
    qt_deploy_runtime(${target})
endfunction()