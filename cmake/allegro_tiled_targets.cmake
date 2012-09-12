## This file setups the targets like install and uninstall

# Configure make install
if (NOT CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX /usr/local)
endif(NOT CMAKE_INSTALL_PREFIX)

# Process the pkg-config file
configure_file(
  pc/${PROJECT_NAME}.pc.in
  ${LIBRARY_OUTPUT_PATH}/pkgconfig/${PROJECT_NAME}-${allegro_VERSION}.pc
  @ONLY
)

install(
  TARGETS ${PROJECT_NAME}
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
)

install(
  FILES       ${${PROJECT_NAME}_HEADERS}
  DESTINATION include/allegro5
)

install(
  FILES ${LIBRARY_OUTPUT_PATH}/pkgconfig/${PROJECT_NAME}-${allegro_VERSION}.pc
  DESTINATION lib/pkgconfig
)

if (NOT CMAKE_FIND_INSTALL_PATH)
  set(CMAKE_FIND_INSTALL_PATH ${CMAKE_ROOT})
endif(NOT CMAKE_FIND_INSTALL_PATH)

# Configure make uninstall
add_custom_target(uninstall @echo uninstall package)

if (UNIX)
  add_custom_command(
    COMMENT "uninstall package"
    COMMAND xargs ARGS rm < install_manifest.txt
    TARGET  uninstall
  )
else(UNIX)
  add_custom_command(
    COMMENT "uninstall only implemented in unix"
    TARGET  uninstall
  )
endif(UNIX)