cmake_minimum_required(VERSION 3.14)

project(UsingSwift_v1 LANGUAGES CXX C OBJC OBJCXX Swift)

set(A_DIR_MODULE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(A_DIR_MODULES_BINARY_LIBRARIES "${CMAKE_CURRENT_BINARY_DIR}/${A_NAME_TARGET}_libraries")

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check https://doc.qt.io/qt/deployment-android.html for more information.
# They need to be set before the find_package(...) calls below.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so)
#    endif()
#endif()



#set(CMAKE_Swift_LANGUAGE_VERSION 5.0)

#set(SWIFT_OBJC_INTERFACE_HEADER_NAME "aswiftobjcinterface.h")
#set(SWIFT_OBJC_BRIDGING_HEADER "${A_DIR_MODULE_ROOT}/aswiftbridging.h")

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick REQUIRED)

set(PROJECT_SOURCES
        main.cpp
        qml.qrc
		aswift.cpp
		aswift.h
		aswiftbridging.h
		aswiftiosnative.h
		aswiftiosnative.mm
		aswiftiosobjc.h
		aswiftiosswift.swift
)

set(A_DIR_MODULE_LOGGER ${A_DIR_MODULE_ROOT}/cpp/Logger)
if(EXISTS ${A_DIR_MODULE_LOGGER})
	add_subdirectory(${A_DIR_MODULE_LOGGER} ${A_DIR_MODULES_BINARY_LIBRARIES}/Logger)
	message(STATUS "Added module: ALogger")
else()
	message(FATAL_ERROR "No Module ALogger cmake file: ${A_DIR_MODULE_LOGGER}")
endif()

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(UsingSwift_v1
        ${PROJECT_SOURCES}
    )
else()
    if(ANDROID)
        add_library(UsingSwift_v1 SHARED
            ${PROJECT_SOURCES}
        )
    else()
        add_executable(UsingSwift_v1
          ${PROJECT_SOURCES}
        )
    endif()
endif()

target_compile_definitions(UsingSwift_v1
	PRIVATE
		$<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)

target_link_libraries(UsingSwift_v1
	PRIVATE
		Qt${QT_VERSION_MAJOR}::Core
		Qt${QT_VERSION_MAJOR}::Quick
		ALogger
)

set_target_properties(UsingSwift_v1
	PROPERTIES
		XCODE_ATTRIBUTE_SWIFT_OBJC_INTERFACE_HEADER_NAME "aswiftobjcinterface.h"
		XCODE_ATTRIBUTE_SWIFT_OBJC_BRIDGING_HEADER "${A_DIR_MODULE_ROOT}/aswiftbridging.h"
		XCODE_ATTRIBUTE_ENABLE_BITCODE "NO"
		XCODE_ATTRIBUTE_ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES "YES"
		XCODE_ATTRIBUTE_SWIFT_VERSION "5.0"
)
