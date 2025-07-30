cmake_minimum_required(VERSION 3.16)

set(A_TARGET_NAME Library2_v4)

project(${A_TARGET_NAME} LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(${A_TARGET_NAME} STATIC
	alibrary2_v4.cpp
	alibrary2_v4.h
)

target_compile_definitions(${A_TARGET_NAME}
	PRIVATE
		LIBRARY2_V4_LIBRARY
)

target_include_directories(${A_TARGET_NAME}
	PUBLIC
		${CMAKE_CURRENT_SOURCE_DIR}
)
