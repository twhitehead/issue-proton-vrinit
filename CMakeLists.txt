cmake_minimum_required(VERSION 3.16.0 FATAL_ERROR)

project(test CXX)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(PROCESSOR_ARCH "64")
else()
  set(PROCESSOR_ARCH "32")
endif()

add_library(openvr_api SHARED IMPORTED)
set_target_properties(openvr_api PROPERTIES
                      IMPORTED_IMPLIB "${PROJECT_SOURCE_DIR}/openvr/lib/win${PROCESSOR_ARCH}/openvr_api.lib"
                      IMPORTED_LOCATION "${PROJECT_SOURCE_DIR}/openvr/bin/win${PROCESSOR_ARCH}/openvr_api.dll"
                      INTERFACE_INCLUDE_DIRECTORIES "${PROJECT_SOURCE_DIR}/openvr/headers")
install(IMPORTED_RUNTIME_ARTIFACTS openvr_api)

add_executable(test test.cpp)
target_link_libraries(test PUBLIC openvr_api)
install(TARGETS test)
