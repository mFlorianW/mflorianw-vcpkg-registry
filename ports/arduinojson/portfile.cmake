vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bblanchon/ArduinoJson
    REF v6.19.3
    SHA256 7abf875071a79e3e506cf8334773d647a5caad98
    HEAD_REF master
)

vcpkg_cmake_configure(SOURCE_PATH ${SOURCE_PATH})
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/README.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/ArduinoJson" RENAME copyright)

