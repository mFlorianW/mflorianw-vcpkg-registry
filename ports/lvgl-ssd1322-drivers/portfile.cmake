vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lvgl/lv_drivers
    REF "v${VERSION}"
    SHA512 52c33dd654ad8a114c9572d75d63a11d93156448bcce84995f8c8b24ec640e54c062e4958bf644f1fa0dc2094b15fa3ed65dd7fdca2e11df05a74c616f9c5a12
    HEAD_REF master
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/lv_drv_conf.h" DESTINATION "${SOURCE_PATH}")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/lvgl-ssd1322-driversConfig.cmake.in" DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
