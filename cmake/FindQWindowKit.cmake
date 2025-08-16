if (NOT QWindowKit_FOUND)

    list(APPEND CMAKE_PREFIX_PATH "D:/Software/qwindowkit/install/lib/cmake")
    if(EXISTS "D:/Software/qwindowkit/install/lib/cmake/QWindowKit/QWindowKitConfig.cmake")
        include("D:/Software/qwindowkit/install/lib/cmake/QWindowKit/QWindowKitConfig.cmake")
        set(QWindowKit_FOUND TRUE)
        return()
    endif()

    message(STATUS "QWindowKitConfig.cmake not found, fallback to manual settings")

    if (NOT QWINDOWKIT_ROOT_DIR)
        set(QWINDOWKIT_ROOT_DIR "D:/Software/qwindowkit/install"
            CACHE PATH "QWindowKit root directory")
    endif()

    # 包含头文件
    set(QWINDOWKIT_INCLUDE_DIR "${QWINDOWKIT_ROOT_DIR}/include/QWindowKit")

    # 库路径
    set(QWINDOWKIT_LIB_DIR "${QWINDOWKIT_ROOT_DIR}/lib")

    if (WIN32)
        set(QWINDOWKIT_CORE_LIBRARY    "${QWINDOWKIT_LIB_DIR}/QWKCore.lib")
        set(QWINDOWKIT_QUICK_LIBRARY   "${QWINDOWKIT_LIB_DIR}/QWKQuick.lib")
        set(QWINDOWKIT_WIDGETS_LIBRARY "${QWINDOWKIT_LIB_DIR}/QWKWidgets.lib")
    elseif (APPLE)
        set(QWINDOWKIT_CORE_LIBRARY    "${QWINDOWKIT_LIB_DIR}/libQWKCore.dylib")
        set(QWINDOWKIT_QUICK_LIBRARY   "${QWINDOWKIT_LIB_DIR}/libQWKQuick.dylib")
        set(QWINDOWKIT_WIDGETS_LIBRARY "${QWINDOWKIT_LIB_DIR}/libQWKWidgets.dylib")
    elseif (UNIX)
        set(QWINDOWKIT_CORE_LIBRARY    "${QWINDOWKIT_LIB_DIR}/libQWKCore.so")
        set(QWINDOWKIT_QUICK_LIBRARY   "${QWINDOWKIT_LIB_DIR}/libQWKQuick.so")
        set(QWINDOWKIT_WIDGETS_LIBRARY "${QWINDOWKIT_LIB_DIR}/libQWKWidgets.so")
    endif()

    add_library(QWindowKit::Core UNKNOWN IMPORTED)
    set_target_properties(QWindowKit::Core PROPERTIES
        IMPORTED_LOCATION "${QWINDOWKIT_CORE_LIBRARY}"
        INTERFACE_INCLUDE_DIRECTORIES "${QWINDOWKIT_INCLUDE_DIR}"
    )

    add_library(QWindowKit::Quick UNKNOWN IMPORTED)
    set_target_properties(QWindowKit::Quick PROPERTIES
        IMPORTED_LOCATION "${QWINDOWKIT_QUICK_LIBRARY}"
        INTERFACE_INCLUDE_DIRECTORIES "${QWINDOWKIT_INCLUDE_DIR}"
    )

    add_library(QWindowKit::Widgets UNKNOWN IMPORTED)
    set_target_properties(QWindowKit::Widgets PROPERTIES
        IMPORTED_LOCATION "${QWINDOWKIT_WIDGETS_LIBRARY}"
        INTERFACE_INCLUDE_DIRECTORIES "${QWINDOWKIT_INCLUDE_DIR}"
    )
endif()


# =======================
# QWindowKit 拷贝运行时 DLL
# =======================
function(qwindowkit_copy_runtime TARGET_NAME)
    if(WIN32)
        set(QWINDOWKIT_BIN_DIR "${QWINDOWKIT_ROOT_DIR}/bin")

        add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy_directory
                "${QWINDOWKIT_BIN_DIR}"
                "$<TARGET_FILE_DIR:${TARGET_NAME}>"
        )

        message(STATUS "QWindowKit DLLs will be copied from ${QWINDOWKIT_BIN_DIR} to target runtime dir")
    elseif(APPLE OR UNIX)
        # macOS / Linux 拷贝 .dylib / .so
        set(QWINDOWKIT_LIB_DIR "${QWINDOWKIT_ROOT_DIR}/lib")

        add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy_directory
                "${QWINDOWKIT_LIB_DIR}"
                "$<TARGET_FILE_DIR:${TARGET_NAME}>"
        )

        message(STATUS "QWindowKit shared libs will be copied from ${QWINDOWKIT_LIB_DIR} to target runtime dir")
    endif()
endfunction()
