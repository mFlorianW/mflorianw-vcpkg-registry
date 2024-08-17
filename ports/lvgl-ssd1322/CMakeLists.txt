################################################################################
# Project
################################################################################
cmake_minimum_required (VERSION 3.9)
project(lvgl-ssd1322
    VERSION 7.5.0
)
################################################################################
# Modules
################################################################################
include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

################################################################################
# Variables
################################################################################
set(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR}/lvgl-ssd1322 CACHE PATH "Location of header lvgl-ssd1322 files")

################################################################################
# Source
################################################################################
file(GLOB LVGL_SOURCES_HEADER
    "${CMAKE_CURRENT_SOURCE_DIR}/*.h"
)

file(GLOB LVGL_SOURCES_HEADER_SRC
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.h"
)

file(GLOB LVGL_SOURCES_HEADER_CORE
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_core/*.h"
)

file(GLOB LVGL_SOURCES_HEADER_DRAW
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_draw/*.h"
)

file(GLOB LVGL_SOURCES_HEADER_FONT
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_font/*.h"
)

file(GLOB LVGL_SOURCES_HEADER_GPU
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_gpu/*.h"
)

file(GLOB LVGL_SOURCES_HEADER_HAL
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_hal/*.h"
)

file(GLOB LVGL_SOURCES_HEADER_MISC
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_misc/*.h"
)

file(GLOB LVGL_SOURCES_HEADER_THEMES
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_themes/*.h"
)

file(GLOB LVGL_SOURCES_HEADER_WIDGETS
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_widgets/*.h"
)

file(GLOB LVGL_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_core/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_draw/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_font/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_gpu/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_hal/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_misc/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_themes/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_widgets/*.c"
)

################################################################################
# Build
################################################################################
add_library(${PROJECT_NAME} ${LVGL_SOURCES})
target_include_directories(lvgl-ssd1322
    PRIVATE
        "${CMAKE_CURRENT_SOURCE_DIR}"
        "${CMAKE_CURRENT_SOURCE_DIR}/src"
        "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_core/"
        "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_draw"
        "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_font"
        "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_gpu"
        "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_hal"
        "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_misc"
        "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_themes"
        "${CMAKE_CURRENT_SOURCE_DIR}/src/lv_widgets"
    PUBLIC
        "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>/lvgl-ssd1322"
)

################################################################################
# CMakePackageConfig
################################################################################
configure_package_config_file(
    ${PROJECT_NAME}Config.cmake.in
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    INSTALL_DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}
    PATH_VARS INCLUDE_INSTALL_DIR
)

write_basic_package_version_file(
    ${PROJECT_NAME}Version.cmake
    VERSION "${PROJECT_VERSION}"
    COMPATIBILITY SameMinorVersion
)

################################################################################
# Install
################################################################################
install(
    TARGETS ${PROJECT_NAME}
    EXPORT ${PROJECT_NAME}Targets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(EXPORT lvgl-ssd1322Targets NAMESPACE lvgl-ssd1322:: DESTINATION share/${PROJECT_NAME})
install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Version.cmake"
    DESTINATION "${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}"
)

INSTALL(FILES ${LVGL_SOURCES_HEADER} DESTINATION "${INCLUDE_INSTALL_DIR}/")
INSTALL(FILES ${LVGL_SOURCES_HEADER_SRC} DESTINATION "${INCLUDE_INSTALL_DIR}/src/")
INSTALL(FILES ${LVGL_SOURCES_HEADER_CORE} DESTINATION "${INCLUDE_INSTALL_DIR}/src/lv_core")
INSTALL(FILES ${LVGL_SOURCES_HEADER_DRAW} DESTINATION "${INCLUDE_INSTALL_DIR}/src/lv_draw")
INSTALL(FILES ${LVGL_SOURCES_HEADER_FONT} DESTINATION "${INCLUDE_INSTALL_DIR}/src/lv_font")
INSTALL(FILES ${LVGL_SOURCES_HEADER_GPU} DESTINATION "${INCLUDE_INSTALL_DIR}/src/lv_gpu")
INSTALL(FILES ${LVGL_SOURCES_HEADER_HAL} DESTINATION "${INCLUDE_INSTALL_DIR}/src/lv_hal")
INSTALL(FILES ${LVGL_SOURCES_HEADER_MISC} DESTINATION "${INCLUDE_INSTALL_DIR}/src/lv_misc")
INSTALL(FILES ${LVGL_SOURCES_HEADER_THEMES} DESTINATION "${INCLUDE_INSTALL_DIR}/src/lv_themes")
INSTALL(FILES ${LVGL_SOURCES_HEADER_WIDGETS} DESTINATION "${INCLUDE_INSTALL_DIR}/src/lv_widgets")
