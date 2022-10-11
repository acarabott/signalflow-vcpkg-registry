vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO acarabott/signalflow
  REF f93c20692fd6d8d005fe8b71464155eb87a6e262
  SHA512 14b2af57205234d7bc829513fbe6cb562b5c0a5bab3c4d3f282e48e0211ca6e07abe691a152f2fb29e53e1bc3234ae5cdfd74685b0741b2e5b2aa718abc140e9
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
