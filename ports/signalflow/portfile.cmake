vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO acarabott/signalflow
  REF e2ff7943684898e1bc8073c6db5d7e9a98dbcab6
  SHA512 e2b4cb89344f90decd299894b30b18f7fb618b4f04e2781f487640c88b66dfb1c362e3126863192e6b946e6f3a097b465d1edfe23da16b4445df8cba2f2fedef
  HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
  FEATURES
    soundio   CMAKE_BUILD_SOUNDIO
    fileio    CMAKE_BUILD_FILEIO
    python    CMAKE_BUILD_PYTHON
    vamp      CMAKE_BUILD_VAMP
    examples  BUILD_EXAMPLES
)

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
  PREFER_NINJA
  OPTIONS
    ${FEATURE_OPTIONS}
)

vcpkg_install_cmake()

file(INSTALL "${SOURCE_PATH}/source/include/" DESTINATION "${CURRENT_PACKAGES_DIR}/include")

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

file(
  INSTALL ${SOURCE_PATH}/LICENSE.md
  DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}
  RENAME copyright)
