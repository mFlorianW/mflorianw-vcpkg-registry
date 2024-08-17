vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lvgl/lvgl
    REF "v${VERSION}"
    SHA512 33b0bf74ebba186a794e4e563ea51419d8482110be37706df3ed1104036d2f51283799d80a4990a6ffdd45ecd91836c6b9bd5f8b168342a589fa1e9dcbdd8813
    HEAD_REF master
)

file(COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/lv_conf.h" DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()
#vcpkg_cmake_config_fixup(PACKAGE_NAME ${PORT})

file(INSTALL "${SOURCE_PATH}/LICENCE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
