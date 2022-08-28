vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO acarabott/signalflow
  REF vcpkg 
  SHA512 59dbb938a87beec5f54778cff1500470f68565d83a53059908a2d0cf1452d0a1390e85d26447701ffefdc997b8118b78c7afc1947c6ab940eea0288b4784a42b
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

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE.md"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
