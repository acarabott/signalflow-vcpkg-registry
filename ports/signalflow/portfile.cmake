vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO acarabott/signalflow
  REF 2a929347800aac25e047ccf56f2d8e3949c131fd
  SHA512 050ffefd252fa7a2f7675c5fde6c19617eadd3bdf7a6d0a6807e0f139181ab3cdcc04dfbe44c6357e7a98df8ef4f21b6aa84c7f3521cf0c4f9f7660878ae4a2b
  HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
  FEATURES
    soundio   CMAKE_BUILD_SOUNDIO
    fileio    CMAKE_BUILD_FILEIO
    python    CMAKE_BUILD_PYTHON
    vamp      CMAKE_BUILD_VAMP
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
