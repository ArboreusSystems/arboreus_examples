cmake_minimum_required(VERSION 3.16)

set(A_NAME_PROJECT "SQLiteApplication")
set(A_NAME_APPLICATION "app${A_NAME_PROJECT}")

set(A_DIR_ROOT ${CMAKE_CURRENT_LIST_DIR})
set(A_DIR_LIBRARY "${A_DIR_ROOT}/../Library")
set(A_DIR_LIBRARY_BUILD "${CMAKE_CURRENT_BINARY_DIR}/Library")

project(${A_NAME_PROJECT} VERSION 0.1 LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

add_subdirectory(${A_DIR_LIBRARY} ${A_DIR_LIBRARY_BUILD})

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(${A_NAME_APPLICATION}
    main.cpp
)

qt_add_qml_module(${A_NAME_APPLICATION}
    URI Application
    VERSION 1.0
    QML_FILES
        Main.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${A_NAME_APPLICATION} PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appApplication
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${A_NAME_APPLICATION}
	PRIVATE
		Qt6::Quick
		ALibrary
)

