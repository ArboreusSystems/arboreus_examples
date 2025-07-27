cmake_minimum_required(VERSION 3.16)

set(A_TARGET_NAME Application_v4)
set(A_APPLICATION_NAME APP_${A_TARGET_NAME})

project(${A_TARGET_NAME} VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(${A_APPLICATION_NAME}
    main.cpp
)

qt_add_qml_module(${A_APPLICATION_NAME}
	URI ${A_TARGET_NAME}
    VERSION 1.0
    QML_FILES
        Main.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${A_APPLICATION_NAME} PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appApplication_v4
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${A_APPLICATION_NAME}
	PRIVATE
		Qt6::Quick
		Library1_v4
		Library2_v4
		Library3_v4
)

