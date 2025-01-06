cmake_minimum_required(VERSION 3.16)

project(UsingCPPSwiftInterop_v2 VERSION 0.1 LANGUAGES CXX)

set(A_WRAPPER_LIB_DIR ${CMAKE_SOURCE_DIR}/../WrapperSwift/DerivedData/WrapperSwift/Build/Products)
set(A_WRAPPER_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/../WrapperSwift/WrapperSwift)

if(IOS)
        if(${CMAKE_OSX_SYSROOT} MATCHES "iphonesimulator")
            message(STATUS "Build for iphonesimulator")
            set(A_WRAPPER_TYPE "Debug-iphonesimulator")
        elseif(${CMAKE_OSX_SYSROOT} MATCHES "iphoneos")
            message(STATUS "Build for iphone")
            set(A_WRAPPER_TYPE "Debug-iphoneos")
        else()
            message(FATAL_ERROR "iOS undefined build")
        endif()
elseif(APPLE)
    message(STATUS "Build for macos")
    set(A_WRAPPER_TYPE "Debug-maccatalyst")
else()
        message(FATAL_ERROR "Undefined build")
endif()


set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)


qt_add_executable(appUsingCPPSwiftInterop_v2
    main.cpp
)

qt_add_qml_module(appUsingCPPSwiftInterop_v2
    URI UsingCPPSwiftInterop_v2
    VERSION 1.0
    QML_FILES
        Main.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appUsingCPPSwiftInterop_v2 PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appUsingCPPSwiftInterop_v2
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_include_directories(appUsingCPPSwiftInterop_v2
    PRIVATE
        ${A_WRAPPER_INCLUDE_DIR}
)

target_link_libraries(appUsingCPPSwiftInterop_v2
    PRIVATE
        Qt6::Quick
        ${A_WRAPPER_LIB_DIR}/${A_WRAPPER_TYPE}/libWrapperSwift.a
)

