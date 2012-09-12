## Project Setup
cmake_minimum_required(VERSION 2.8)

set(PROJECT_NAME allegro_tiled)
project(${PROJECT_NAME})

## Configurations
include(${PROJECT_SOURCE_DIR}/cmake/allegro_tiled_settings.cmake)

# Set the source files, headers, and link libraries
file(GLOB ${PROJECT_NAME}_SRCS src/*.c)
set(${PROJECT_NAME}_HEADERS include/allegro5/${PROJECT_NAME}.h)
set(${PROJECT_NAME}_LINK_LIBS )

## Build the agame project
# Find Allegro
find_package(allegro REQUIRED QUIET COMPONENTS
  main image
)
include_directories(${allegro_INCLUDE_DIRS})
list(APPEND ${PROJECT_NAME}_LINK_LIBS ${allegro_LIBRARIES})

# Find libxml2
find_package(LibXml2 REQUIRED)
include_directories(${LIBXML2_INCLUDE_DIR})
list(APPEND ${PROJECT_NAME}_LINK_LIBS ${LIBXML2_LIBRARIES})

# Find zlib
find_package(zlib REQUIRED)
include_directories(${zlib_INCLUDE_DIRS})
list(APPEND ${PROJECT_NAME}_LINK_LIBS ${zlib_LIBRARIES})

# Find libpng
find_package(png REQUIRED)
include_directories(${PNG_INCLUDE_DIRS})
list(APPEND ${PROJECT_NAME}_LINK_LIBS ${PNG_LIBRARIES})

# Find glib (use pkg-config)
find_package(PkgConfig REQUIRED)
pkg_check_modules(GLIB_PKG glib-2.0)
include_directories(${GLIB_PKG_INCLUDE_DIRS})
link_directories(${GLIB_PKG_LIBRARY_DIRS})
list(APPEND ${PROJECT_NAME}_LINK_LIBS ${GLIB_PKG_LIBRARIES})

# Compile the Library
add_library(${PROJECT_NAME} ${${PROJECT_NAME}_SRCS})
target_link_libraries(${PROJECT_NAME} ${${PROJECT_NAME}_LINK_LIBS})

# Compile the example
add_executable(${PROJECT_NAME}_example example/src/main.c)
target_link_libraries(
  ${PROJECT_NAME}_example
  ${PROJECT_NAME} ${${PROJECT_NAME}_LINK_LIBS}
)

# Setup targets
include(${PROJECT_SOURCE_DIR}/cmake/allegro_tiled_targets.cmake)
