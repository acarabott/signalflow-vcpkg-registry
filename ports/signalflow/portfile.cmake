# vcpkg_from_github(
#   OUT_SOURCE_PATH SOURCE_PATH
#   REPO acarabott/signalflow
#   REF 9c90ce0849e310841340ff7a09e250a6e8e553be
#   SHA512 1c8c418bea7cc5df72e754f3001f7000cf7bbf1e71c361485aff6a7e44dded761fd9f091015012f747a232c168a43033fb4974204c340a5e358b046727b0a020
#   HEAD_REF master
# )

vcpkg_from_git(
  OUT_SOURCE_PATH SOURCE_PATH
  URL /Users/ac/src/signalflow
  REF 2a929347800aac25e047ccf56f2d8e3949c131fd
  HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS
    -DCMAKE_BUILD_SOUNDIO=ON
    -DCMAKE_BUILD_FILEIO=ON
)
vcpkg_install_cmake()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE.md"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
