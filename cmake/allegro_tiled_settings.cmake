# Set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
# set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

# Uncomment the line below to set the build type
# set(CMAKE_BUILD_TYPE DEBUG)

# Extend the find_package search path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules")

## Configure the build system
# Add the include folder to the include path
include_directories(${PROJECT_SOURCE_DIR}/include)
