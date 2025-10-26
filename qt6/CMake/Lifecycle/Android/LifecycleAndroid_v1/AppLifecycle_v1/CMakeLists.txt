cmake_minimum_required(VERSION 3.16)

## ----------------------------------------
## Global variables

set(A_NAME AppLifecycle_v1)
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

project(${A_NAME_TARGET} VERSION 0.1 LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)


## ----------------------------------------
## Project variables

set(${A_PREFIX}_DIR_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

set(${A_PREFIX}_SOURCES)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE)
set(${A_PREFIX}_SOURCES_CPP_HEADERS)
set(${A_PREFIX}_SOURCES_CPP)
set(${A_PREFIX}_SOURCES_OBJC_HEADERS)
set(${A_PREFIX}_SOURCES_OBJC)
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

set(${A_PREFIX}_SOURCES_OBJC_HEADERS
	${${A_PREFIX}_SOURCES_OBJC_HEADERS}
)

set(${A_PREFIX}_SOURCES_OBJC
	${${A_PREFIX}_SOURCES_OBJC}
)

set(${A_PREFIX}_SOURCES_RESOURCES
	${${A_PREFIX}_SOURCES_RESOURCES}
	main.qrc
)

set(${A_PREFIX}_SOURCES
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${${A_PREFIX}_SOURCES_CPP_HEADERS}
	${${A_PREFIX}_SOURCES_CPP}
	${${A_PREFIX}_SOURCES_OBJC_HEADERS}
	${${A_PREFIX}_SOURCES_OBJC}
	${${A_PREFIX}_SOURCES_RESOURCES}
)

set(${A_PREFIX}_INCLUDE_DIR_PUBLIC
	${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
	${${A_PREFIX}_DIR_ROOT}
	${${A_PREFIX}_DIR_ROOT}/Delegate
)

if(ANDROID)

	set(QT_FORCE_CMP0156_TO_VALUE NEW)

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
	set_target_properties(${A_NAME_APPLICATION} PROPERTIES ${${A_PREFIX}_PROPERTIES})
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
		Logger
)


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
