vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO bblanchon/ArduinoJson
    REF v${VERSION}
    SHA512 df2a89c8f9a03ebb6c2ebd014092e6802826e271a06a76d267ad21cd062f6f60adb058f47f352a6155c3f5407be609815cbcda29cb98f18cfb5283cf6563cbbd
    HEAD_REF 6.x
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DBUILD_TESTING=OFF
)
vcpkg_cmake_install()
file(INSTALL "${SOURCE_PATH}/LICENSE.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
