cmake_minimum_required(VERSION 3.16)

project(MPI_v2 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(MPI REQUIRED)

add_executable(MPI_v2 main.cpp)

include(GNUInstallDirs)
install(TARGETS MPI_v2
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

target_link_libraries(MPI_v2
	PUBLIC
		MPI::MPI_CXX
)
