cmake_minimum_required(VERSION 3.5)

set(A_PROJECT_NAME OpenCV_v1)
project(${A_PROJECT_NAME} LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(OpenCV REQUIRED)

add_executable(${A_PROJECT_NAME}
	main.cpp
)

target_include_directories(${A_PROJECT_NAME} PUBLIC ${OpenCV_INCLUDE_DIRS})
target_link_libraries(${A_PROJECT_NAME} ${OpenCV_LIBS})
