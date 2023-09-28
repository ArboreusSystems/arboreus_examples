cmake_minimum_required(VERSION 3.5)

set(A_PROJECT_NAME FFMPEG_v1)
project(${A_PROJECT_NAME} LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_path(AVCODEC_INCLUDE_DIR libavcodec/avcodec.h)
find_library(AVCODEC_LIBRARY avcodec)

find_path(AVFORMAT_INCLUDE_DIR libavformat/avformat.h)
find_library(AVFORMAT_LIBRARY avformat)

find_path(AVUTIL_INCLUDE_DIR libavutil/avutil.h)
find_library(AVUTIL_LIBRARY avutil)

find_path(AVDEVICE_INCLUDE_DIR libavdevice/avdevice.h)
find_library(AVDEVICE_LIBRARY avdevice)

set(A_SOURCES
	main.cpp
)

set(A_DIR_CONF_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/..")
set(A_CONF_HEADER "${A_DIR_CONF_HEADER}/FFMPEG.conf.h")
if(EXISTS ${A_CONF_HEADER})
	set(A_SOURCES ${A_SOURCES} ${A_CONF_HEADER})
	message(STATUS "Added project configuration file for ${A_PROJECT_NAME}: ${A_CONF_HEADER}")
else()
	message(FATAL_ERROR "No project configuration file for ${A_PROJECT_NAME}: ${A_CONF_HEADER}")
endif()

add_executable(${A_PROJECT_NAME} ${A_SOURCES})

target_include_directories(${A_PROJECT_NAME}
	PRIVATE
		${AVCODEC_INCLUDE_DIR}
		${AVFORMAT_INCLUDE_DIR}
		${AVUTIL_INCLUDE_DIR}
		${AVDEVICE_INCLUDE_DIR}
)
target_link_libraries(${A_PROJECT_NAME}
	PRIVATE
		${AVCODEC_LIBRARY}
		${AVFORMAT_LIBRARY}
		${AVUTIL_LIBRARY}
		${AVDEVICE_LIBRARY}
)
