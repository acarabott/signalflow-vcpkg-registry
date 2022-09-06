vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO acarabott/signalflow
  REF 5b74073a5354c78b648285872284c3dd7dcbd24a
  SHA512 877d0ddeddbefc4ec6df7380852987cbc7c7a1f3ef3378debd7dc136a39aad6ba3980168474bd495c4ef68d2bd711076746754183bd6724be7939b5f3ffaa5ed
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
