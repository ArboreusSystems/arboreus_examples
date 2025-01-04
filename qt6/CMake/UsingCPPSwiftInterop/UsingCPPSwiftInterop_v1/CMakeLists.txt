cmake_minimum_required(VERSION 3.16)

set(A_NAME_PROJECT UsingCPPSwiftInterop_v1)
set(A_NAME_TARGET app${A_NAME_PROJECT})
set(A_DIR_MODULE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(A_DIR_SWIFT ${A_DIR_MODULE_ROOT}/Swift)

project(${A_NAME_PROJECT}
	VERSION 0.1
	LANGUAGES CXX Swift
)

list(APPEND CMAKE_MODULE_PATH "${A_DIR_MODULE_ROOT}/CMake")
include(SwiftCPPInterop)

ACheckSwiftRequirements()
ASetupSwiftEnvironment()

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_add_executable(${A_NAME_TARGET}
    main.cpp
	qml.qrc
	Swift/atestmodule.swift
)

target_compile_options(${A_NAME_TARGET}
	PUBLIC
		"$<$<COMPILE_LANGUAGE:Swift>:-cxx-interoperability-mode=default>"
)

set_target_properties(${A_NAME_TARGET} PROPERTIES
	MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
	XCODE_ATTRIBUTE_SWIFT_VERSION 5.0
)

target_link_libraries(${A_NAME_TARGET}
    PRIVATE Qt6::Quick
)

AGenerateSwiftHeaders(${A_NAME_TARGET} SwiftCPP.h SEARCH_PATHS ${A_DIR_SWIFT})

