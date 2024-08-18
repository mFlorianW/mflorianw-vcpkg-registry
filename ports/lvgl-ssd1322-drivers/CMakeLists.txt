################################################################################
# Project
################################################################################
cmake_minimum_required (VERSION 3.9)
project(lvgl-ssd1322-drivers
    VERSION 7.5.0
)

################################################################################
# Modules
################################################################################
include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

################################################################################
# Dependencies
################################################################################
find_package(lvgl-ssd1322 REQUIRED)

################################################################################
# Variables
################################################################################
set(INCLUDE_INSTALL_DIR ${CMAKE_INSTALL_INCLUDEDIR}/lvgl-ssd1322-drivers CACHE PATH "Location of header lvgl-ssd1322 files" )

################################################################################
# Source
################################################################################
file(GLOB LVGL_SOURCES_HEADER
    "${CMAKE_CURRENT_SOURCE_DIR}/*.h"
)

file(GLOB LVGL_SOURCES_HEADER_DISPLAY
    "${CMAKE_CURRENT_SOURCE_DIR}/display/*.h"
)

file(GLOB LVGL_SOURCES_HEADER_SRC_INDEV
    "${CMAKE_CURRENT_SOURCE_DIR}/indev/*.h"
)

file(GLOB LVGL_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/display/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/indev/*.c"
)

################################################################################
# Build
################################################################################
add_definitions(-DLV_CONF_INCLUDE_SIMPLE=1 -DLV_LVGL_H_INCLUDE_SIMPLE)
add_library(lvgl-ssd1322-drivers ${LVGL_SOURCES})

target_link_libraries(${PROJECT_NAME} 
    PRIVATE 
        lvgl-ssd1322::lvgl-ssd1322
)

target_include_directories(lvgl-ssd1322-drivers
    PRIVATE
        "${CMAKE_CURRENT_SOURCE_DIR}"
        "${CMAKE_CURRENT_SOURCE_DIR}/display"
        "${CMAKE_CURRENT_SOURCE_DIR}/indev"
    PUBLIC
        "$<INSTALL_INTERFACE:${INCLUDE_INSTALL_DIR}>"
        "$<INSTALL_INTERFACE:${INCLUDE_INSTALL_DIR}>/display"
        "$<INSTALL_INTERFACE:${INCLUDE_INSTALL_DIR}>/indev"
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
install(EXPORT lvgl-ssd1322-driversTargets NAMESPACE lvgl-ssd1322-drivers:: DESTINATION share/${PROJECT_NAME})
install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Version.cmake"
    DESTINATION "${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}"
)
INSTALL(FILES ${LVGL_SOURCES_HEADER} DESTINATION "${INCLUDE_INSTALL_DIR}")
INSTALL(FILES ${LVGL_SOURCES_HEADER_DISPLAY} DESTINATION ${INCLUDE_INSTALL_DIR}/display)
INSTALL(FILES ${LVGL_SOURCES_HEADER_SRC_INDEV} DESTINATION ${INCLUDE_INSTALL_DIR}/indev)
