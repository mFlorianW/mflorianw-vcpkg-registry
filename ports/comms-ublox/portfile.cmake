#header-only library

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO commschamp/cc.ublox.generated
    REF v2.9
    SHA512 a91175d11cc272356aa6fcd7ea0c6903c7157a7174682afeb82efc191e002cdc52f419ed026dc9ae407b68173c2bf6711c528d556d891421dc63f4b0aa86877a
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DOPT_REQUIRE_COMMS_LIB=ON
        -DCMAKE_DISABLE_FIND_PACKAGE_Doxygen=ON
)
vcpkg_cmake_install()

# currently this is only a header only library. after moving lib/ublox to share this lib path will be empty
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

# Handle copyright
file(INSTALL "${CURRENT_PORT_DIR}/copyright" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
