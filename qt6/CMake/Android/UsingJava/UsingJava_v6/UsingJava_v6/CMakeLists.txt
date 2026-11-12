cmake_minimum_required(VERSION 3.16)

## ----------------------------------------
## Global variables

set(A_NAME UsingJava_v6)
set(A_NAME_TARGET target_${A_NAME})
set(A_NAME_APPLICATION ${A_NAME})
set(A_PREFIX A_${A_NAME_TARGET})
set(${A_PREFIX}_DIR_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

set(${A_PREFIX}_BUILD_TYPE ${CMAKE_BUILD_TYPE})
if(NOT ${A_PREFIX}_BUILD_TYPE STREQUAL "")
	message(STATUS "Defined build type: " ${${A_PREFIX}_BUILD_TYPE})
else()
	message(FATAL_ERROR "Can't define build type")
endif()


## ----------------------------------------
## Project settings

project(${A_NAME_TARGET} VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)


## ----------------------------------------
## Project variables

set(${A_PREFIX}_DIR_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

set(${A_PREFIX}_SOURCES)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE)
set(${A_PREFIX}_SOURCES_HEADERS)
set(${A_PREFIX}_SOURCES_CPP)
set(${A_PREFIX}_SOURCES_RESOURCES)

set(${A_PREFIX}_PROPERTIES)

set(${A_PREFIX}_INCLUDE_DIR_PUBLIC)
set(${A_PREFIX}_INCLUDE_DIR_PRIVATE)


## ----------------------------------------
## Project sources

set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	main_pch.h
)

set(${A_PREFIX}_SOURCES_CPP
	${${A_PREFIX}_SOURCES_CPP}
	main.cpp
)

set(${A_PREFIX}_SOURCES_RESOURCES
	${${A_PREFIX}_SOURCES_RESOURCES}
	main.qrc
)

set(${A_PREFIX}_SOURCES
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${${A_PREFIX}_SOURCES_HEADERS}
	${${A_PREFIX}_SOURCES_CPP}
	${${A_PREFIX}_SOURCES_RESOURCES}
)

set(${A_PREFIX}_INCLUDE_DIR_PUBLIC
	${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
	${${A_PREFIX}_DIR_ROOT}
)

if(APPLE)

	set(${A_PREFIX}_PROPERTIES
		${${A_PREFIX}_PROPERTIES}
		MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
		MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
		MACOSX_BUNDLE TRUE
	)

endif()

if(IOS)

	# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
	# If you are developing for iOS or macOS you should consider setting an
	# explicit, fixed bundle identifier manually though.

	set(${A_PREFIX}_PROPERTIES
		${${A_PREFIX}_PROPERTIES}
		# MACOSX_BUNDLE_GUI_IDENTIFIER "UsingJava_v6"
		# MACOSX_BUNDLE_INFO_PLIST "${${A_PREFIX}_IOS_INFO_PLIST}"
		MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
		MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
		MACOSX_BUNDLE TRUE
	)

endif()

if(ANDROID)

	set(QT_FORCE_CMP0156_TO_VALUE NEW)

	set(${A_PREFIX}_ANDROID_DIR ${${A_PREFIX}_DIR_ROOT}/Platforms/Android)
	set(${A_PREFIX}_ANDROID_DIR_SOURCES ${${A_PREFIX}_ANDROID_DIR}/src)

	set(${A_PREFIX}_PROPERTIES
		${${A_PREFIX}_PROPERTIES}
		QT_ANDROID_PACKAGE_SOURCE_DIR "${${A_PREFIX}_ANDROID_DIR}"
	)

endif()


## ----------------------------------------
## Qt Application settings

find_package(Qt6 REQUIRED COMPONENTS Quick)
qt_standard_project_setup(REQUIRES 6.8)
qt_add_executable(${A_NAME_APPLICATION} ${${A_PREFIX}_SOURCES})


## ----------------------------------------
## Application properties

list(LENGTH ${A_PREFIX}_PROPERTIES ${A_PREFIX}_PROPERTIES_LENGTH)
if(NOT ${A_PREFIX}_PROPERTIES_LENGTH EQUAL 0)
	set_target_properties(${A_NAME_APPLICATION}
		PROPERTIES
			${${A_PREFIX}_PROPERTIES}
	)
endif()


## ----------------------------------------
## Include directories settings

target_include_directories(${A_NAME_APPLICATION}
	PUBLIC ${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
	PRIVATE ${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
)


## ----------------------------------------
## Libraries settings

target_link_libraries(${A_NAME_APPLICATION}
	PRIVATE
		Qt6::Quick
		ALogger
		ALibUsingJava_v6
)

if(ANDROID)

	get_target_property(${A_PREFIX}_LIB_NAME_JAVA_PACKAGE ALibUsingJava_v6 NAME_JAVA_PACKAGE)
	message(STATUS "ALibUsingJava_v6 NAME_JAVA_PACKAGE ${${A_PREFIX}_LIB_NAME_JAVA_PACKAGE}")

	get_target_property(${A_PREFIX}_LIB_NAME_JAVA_VENDOR ALibUsingJava_v6 NAME_JAVA_VENDOR)
	message(STATUS "ALibUsingJava_v6 NAME_JAVA_VENDOR ${${A_PREFIX}_LIB_NAME_JAVA_VENDOR}")

	get_target_property(${A_PREFIX}_LIB_PATH_JAVA_PACKAGE ALibUsingJava_v6 PATH_JAVA_PACKAGE)
	message(STATUS "ALibUsingJava_v6 PATH_JAVA_PACKAGE ${${A_PREFIX}_LIB_PATH_JAVA_PACKAGE}")

	set(${A_PREFIX}_DIR_LIB_VENDOR ${${A_PREFIX}_ANDROID_DIR_SOURCES}/${${A_PREFIX}_LIB_NAME_JAVA_VENDOR})
	set(${A_PREFIX}_DIR_LIB_PACKAGE ${${A_PREFIX}_DIR_LIB_VENDOR}/${${A_PREFIX}_LIB_NAME_JAVA_PACKAGE})

	if(EXISTS "${${A_PREFIX}_DIR_LIB_PACKAGE}" OR IS_SYMLINK "${${A_PREFIX}_DIR_LIB_PACKAGE}")
		file(REMOVE_RECURSE "${${A_PREFIX}_DIR_LIB_PACKAGE}")
	endif()

	file(MAKE_DIRECTORY "${${A_PREFIX}_DIR_LIB_VENDOR}")
	file(CREATE_LINK "${${A_PREFIX}_LIB_PATH_JAVA_PACKAGE}" "${${A_PREFIX}_DIR_LIB_PACKAGE}" SYMBOLIC)

endif()


## ----------------------------------------
## Precompiled headers settings

if(
	NOT ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE} EQUAL "" OR
	NOT ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC} EQUAL ""
)
    if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_OPTION_USING_PCH)
        message(STATUS "Using PCH for ${A_NAME_APPLICATION}")
        target_precompile_headers(${A_NAME_APPLICATION}
			PRIVATE ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
			PUBLIC ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
        )
        set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
    else()
        message(STATUS "No PCH for ${A_NAME_APPLICATION}")
    endif()
endif()
