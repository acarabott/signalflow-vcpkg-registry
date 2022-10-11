vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO acarabott/signalflow
  REF 914f9ce17fcd51cc0e74d3d87d914f8fd76afa48
  SHA512 1e0b12c98da27011786597976e27ea6e4a57d488f901b2c5f671380ce40baeb0b1f9723b0d96b1da0b30dd4f6548ddd7a38b50b92189c5911e733226d0aa9bea
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
