cmake_minimum_required(VERSION 3.16)

set(A_NAME_PROJECT "SQLite_v6")
set(A_DIR_ROOT ${CMAKE_CURRENT_LIST_DIR})

project(${A_NAME_PROJECT} LANGUAGES C)

set(A_SQLITE_CONF "${A_DIR_ROOT}/../SQlite3.conf.cmake")
if(EXISTS ${A_SQLITE_CONF})
	message(STATUS "Found: ${A_SQLITE_CONF}")
	include(${A_SQLITE_CONF})
else()
	message(FATAL_ERROR "Can't find SQlite3.conf.cmake file: ${A_SQLITE_CONF}")
endif()

add_executable(${A_NAME_PROJECT}
	${A_DIR_ROOT}/main.c
	${A_SQLITE_SOURCES}
)

## "-framework Security" added for MacOS build
target_link_libraries(${A_NAME_PROJECT}
	PRIVATE
		"-framework Security"
)

target_include_directories(${A_NAME_PROJECT}
	PUBLIC
		${A_DIR_ROOT}
	PRIVATE
		${A_SQLITE_DIR}
)
