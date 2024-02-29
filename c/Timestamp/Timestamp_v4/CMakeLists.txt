cmake_minimum_required(VERSION 3.5)

project(Timestamp_v4 LANGUAGES C)

add_executable(Timestamp_v4 main.c)

include(GNUInstallDirs)
install(TARGETS Timestamp_v4
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
