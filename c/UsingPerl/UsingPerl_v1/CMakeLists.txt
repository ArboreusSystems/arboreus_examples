cmake_minimum_required(VERSION 3.5)

project(UsingPerl_v1 LANGUAGES C)

find_package(Perl REQUIRED)

add_executable(UsingPerl_v1 main.c)

include(GNUInstallDirs)
install(TARGETS UsingPerl_v1
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
