# qwindowkit.cmake
# 1) 优先系统包
find_package(QWindowKit QUIET)
if(QWindowKit_FOUND)
    message(STATUS "[MyApp] Using system QWindowKit")
    return()
endif()

# 2) fallback：ThirdParty 子模块
message(STATUS "[MyApp] Using ThirdParty/qwindowkit")

set(QWINDOWKIT_BUILD_QUICK    ON  CACHE BOOL "" FORCE)
set(QWINDOWKIT_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(QWINDOWKIT_BUILD_TESTS    OFF CACHE BOOL "" FORCE)

add_subdirectory(
    ${CMAKE_CURRENT_LIST_DIR}/../../ThirdParty/qwindowkit
    ${CMAKE_BINARY_DIR}/_deps/qwindowkit-build
    EXCLUDE_FROM_ALL)

# 3) 跨平台运行时拷贝
function(qwindowkit_copy_runtime target)
    if(NOT TARGET QWindowKit::Quick)
        return()  # 系统包不拷
    endif()

    # 使用生成器表达式代替直接获取LOCATION属性
    set(_lib_dir $<TARGET_FILE_DIR:QWindowKit::Quick>)

    if(WIN32)
        cmake_path(SET _bin NORMALIZE "${_lib_dir}/../bin")
        if(IS_DIRECTORY "${_bin}")
            add_custom_command(TARGET ${target} POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy_directory
                        "${_bin}" "$<TARGET_FILE_DIR:${target}>")
            message(STATUS "QWindowKit DLLs -> $<TARGET_FILE_DIR:${target}>")
        endif()

    elseif(APPLE)
        cmake_path(SET _macos NORMALIZE "${_lib_dir}/../lib")
        if(IS_DIRECTORY "${_macos}")
            add_custom_command(TARGET ${target} POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy_directory
                        "${_macos}" "$<TARGET_FILE_DIR:${target}>")
            message(STATUS "QWindowKit .dylib -> $<TARGET_FILE_DIR:${target}>")
        endif()

    elseif(UNIX AND NOT APPLE)
        cmake_path(SET _so NORMALIZE "${_lib_dir}/../lib")
        if(IS_DIRECTORY "${_so}")
            add_custom_command(TARGET ${target} POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy_directory
                        "${_so}" "$<TARGET_FILE_DIR:${target}>")
            message(STATUS "QWindowKit .so -> $<TARGET_FILE_DIR:${target}>")
        endif()
    endif()
endfunction()