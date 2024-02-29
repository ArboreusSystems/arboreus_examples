cmake_minimum_required(VERSION 3.5)

project(Timestamp_v5 LANGUAGES C)

add_executable(Timestamp_v5 main.c)

include(GNUInstallDirs)
install(TARGETS Timestamp_v5
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
