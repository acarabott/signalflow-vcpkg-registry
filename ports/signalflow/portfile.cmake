vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO acarabott/signalflow
  REF 9c90ce0849e310841340ff7a09e250a6e8e553be
  SHA512 0 
  HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
  OPTIONS
    -DCMAKE_BUILD_SOUNDIO=OFF
    -DCMAKE_BUILD_FILEIO=OFF
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

file(
  INSTALL "${SOURCE_PATH}/LICENSE.md"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
