cmake_minimum_required(VERSION 3.5)

set(A_PROJECT_NAME OpenCV_RTSP_to_file_v1)
project(${A_PROJECT_NAME} LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )

set(A_SOURCES
	main.cpp
)

set(A_DIR_CONF_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/..")
set(A_CONF_HEADER "${A_DIR_CONF_HEADER}/OpenCV.conf.h")
if(EXISTS ${A_CONF_HEADER})
	set(A_SOURCES ${A_SOURCES} ${A_CONF_HEADER})
	message(STATUS "Added project configuration file for ${A_PROJECT_NAME}: ${A_CONF_HEADER}")
else()
	message(FATAL_ERROR "No project configuration file for ${A_PROJECT_NAME}: ${A_CONF_HEADER}")
endif()

add_executable(${A_PROJECT_NAME} ${A_SOURCES})
target_include_directories(${A_PROJECT_NAME} PUBLIC ${OpenCV_INCLUDE_DIRS})
target_link_libraries(${A_PROJECT_NAME} ${OpenCV_LIBS})

