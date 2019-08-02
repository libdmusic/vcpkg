include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO libdmusic/dlsynth
    HEAD_REF master
)

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
  PREFER_NINJA
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/dlsynth)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/dlsynth/LICENSE ${CURRENT_PACKAGES_DIR}/share/dlsynth/copyright)
vcpkg_test_cmake(PACKAGE_NAME dlsynth)