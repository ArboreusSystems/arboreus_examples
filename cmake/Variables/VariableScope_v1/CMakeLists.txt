cmake_minimum_required(VERSION 3.5)

project(VariableScope_v1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(A_SOURCES
	main.cpp
)

set(ARRAY "Root")

set(TYPE "Parent")
message(STATUS "TYPE: ${TYPE}")

add_subdirectory(Subdir1)

message(STATUS "Subdirectory Subdir1 added")
message(STATUS "TYPE: ${TYPE}")

add_subdirectory(Subdir2)
message(STATUS "Subdirectory Subdir2 added")

message(STATUS "ARRAY: ${ARRAY}")

add_executable(VariableScope_v1 ${A_SOURCES})
