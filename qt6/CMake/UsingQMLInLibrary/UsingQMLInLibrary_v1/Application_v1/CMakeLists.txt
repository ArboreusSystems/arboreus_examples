cmake_minimum_required(VERSION 3.16)

set(A_NAME_PROJECT Application_v1)
set(A_NAME_TARGET app${A_NAME_PROJECT})
set(A_DIR_ROOT ${CMAKE_SOURCE_DIR})
set(A_DIR_BUILD_LIBRARIES ${A_DIR_ROOT}/build/libraries)

project(${A_NAME_PROJECT} VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(A_PROJECT_CONF "${A_DIR_ROOT}/../Global.conf.cmake")
if(EXISTS "${A_PROJECT_CONF}")
    include("${A_PROJECT_CONF}")
else()
    message(FATAL_ERROR "No ${A_NAME_PROJECT} config file")
endif()

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(${A_NAME_TARGET}
    main.cpp
)

qt_add_qml_module(${A_NAME_TARGET}
    URI Application_v1
    VERSION 1.0
    QML_FILES
        Main.qml
)

add_subdirectory(${A_DIR_ROOT_LIBRARY} ${A_DIR_BUILD_LIBRARIES}/Library_v1)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${A_NAME_TARGET} PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appApplication_v1
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${A_NAME_TARGET}
    PRIVATE
        Qt6::Quick
        Library_v1plugin
)

target_include_directories(${A_NAME_TARGET}
    PRIVATE
        ${A_DIR_ROOT_LIBRARY}
)
