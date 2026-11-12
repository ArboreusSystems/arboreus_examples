cmake_minimum_required(VERSION 3.16)


## ----------------------------------------
## Global settings

set(A_NAME_TARGET ALibUsingJava_v6)
set(A_PREFIX A_${A_NAME_TARGET})


## ----------------------------------------
## Project settings

project(${A_NAME_TARGET} LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)


## ----------------------------------------
## Library variables

set(${A_PREFIX}_DIR_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

set(${A_PREFIX}_SOURCES)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE)
set(${A_PREFIX}_SOURCES_HEADERS)
set(${A_PREFIX}_SOURCES_CPP)
set(${A_PREFIX}_SOURCES_RESOURCES)

set(${A_PREFIX}_INCLUDE_DIR_PUBLIC)
set(${A_PREFIX}_INCLUDE_DIR_PRIVATE)


## ----------------------------------------
## Library sources

set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	alibusingjava_v6_pch.h
)

set(${A_PREFIX}_SOURCES_HEADERS
	${${A_PREFIX}_SOURCES_HEADERS}
	alibusingjava_v6.h
)

set(${A_PREFIX}_SOURCES_CPP
	${${A_PREFIX}_SOURCES_CPP}
	alibusingjava_v6.cpp
)

set(${A_PREFIX}_SOURCES
	${${A_PREFIX}_SOURCES}
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

if(ANDROID)

	set(${A_PREFIX}_ANDROID_DIR ${${A_PREFIX}_DIR_ROOT}/Platforms/Android)

	set(${A_PREFIX}_NAME_JAVA_VENDOR "systems/arboreus")
	set(${A_PREFIX}_NAME_JAVA_PACKAGE "AJava")
	set(${A_PREFIX}_PATH_JAVA_PACKAGE "${${A_PREFIX}_ANDROID_DIR}/src/${${A_PREFIX}_NAME_JAVA_VENDOR}/${${A_PREFIX}_NAME_JAVA_PACKAGE}")

	set(${A_PREFIX}_SOURCES
		${${A_PREFIX}_SOURCES}
		${${A_PREFIX}_PATH_JAVA_PACKAGE}/ATestClass.java
	)

	set(${A_PREFIX}_PROPERTIES
		${${A_PREFIX}_PROPERTIES}
		NAME_JAVA_VENDOR "${${A_PREFIX}_NAME_JAVA_VENDOR}"
		NAME_JAVA_PACKAGE "${${A_PREFIX}_NAME_JAVA_PACKAGE}"
		PATH_JAVA_PACKAGE "${${A_PREFIX}_PATH_JAVA_PACKAGE}"
	)

endif()


## ----------------------------------------
## Qt settings

find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup(REQUIRES 6.8)
qt_add_library(${A_NAME_TARGET} STATIC ${${A_PREFIX}_SOURCES})

target_link_libraries(${A_NAME_TARGET}
	PRIVATE
		Qt6::Core
		ALogger
)

target_compile_definitions(${A_NAME_TARGET}
	PRIVATE
		ALIBUSINGJAVA_V6_LIBRARY
)

target_include_directories(${A_NAME_TARGET}
	PUBLIC ${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
	PRIVATE ${${A_PREFIX}_INCLUDE_DIR_PRIVATE}
)

set_target_properties(${A_NAME_TARGET}
	PROPERTIES
		${${A_PREFIX}_PROPERTIES}
)


## ----------------------------------------
## Precompiled headers settings

if(
	NOT ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE} EQUAL "" OR
	NOT ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC} EQUAL ""
)
	if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_OPTION_USING_PCH)
		message(STATUS "Using PCH for ${A_NAME_TARGET}")
		target_precompile_headers(${A_NAME_TARGET}
			PRIVATE ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
			PUBLIC ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
		)
		set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
	else()
		message(STATUS "No PCH for ${A_NAME_TARGET}")
	endif()
endif()
