cmake_minimum_required(VERSION 3.16)

set(A_TARGET_NAME Library3_v4)

project(${A_TARGET_NAME} LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(${A_TARGET_NAME} STATIC
	alibrary3_v4.cpp
	alibrary3_v4.h
)

target_compile_definitions(${A_TARGET_NAME}
	PRIVATE
		LIBRARY3_V4_LIBRARY
)

target_link_libraries(${A_TARGET_NAME}
	INTERFACE
		Library2_v4
)

target_include_directories(${A_TARGET_NAME}
	PUBLIC
		$<TARGET_PROPERTY:Library2_v4,INTERFACE_INCLUDE_DIRECTORIES>
		${CMAKE_CURRENT_SOURCE_DIR}
)
