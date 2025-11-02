cmake_minimum_required(VERSION 3.16)

## ----------------------------------------
## Global variables

set(A_NAME UsingJava_v4)
set(A_NAME_TARGET target_${A_NAME})
set(A_NAME_APPLICATION ${A_NAME})
set(A_PREFIX A_${A_NAME})


## ----------------------------------------
## Project settings

project(${A_NAME_TARGET} VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)
set(QT_FORCE_CMP0156_TO_VALUE NEW)

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

set(${A_PREFIX}_SOURCES_HEADERS
	${${A_PREFIX}_SOURCES_HEADERS}
	Backend/abackend.h
)

set(${A_PREFIX}_SOURCES_CPP
	${${A_PREFIX}_SOURCES_CPP}
	main.cpp
	Backend/abackend.cpp
)

set(${A_PREFIX}_SOURCES_RESOURCES
	${${A_PREFIX}_SOURCES_RESOURCES}
	main.qrc
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


## ----------------------------------------
## Android sources

if(ANDROID)

	set(${A_PREFIX}_ANDROID_DIR "${${A_PREFIX}_DIR_ROOT}/Platforms/android")
	set(${A_PREFIX}_ANDROID_DIR_SRC "${${A_PREFIX}_ANDROID_DIR}/src")

	set(${A_PREFIX}_PROPERTIES
		${${A_PREFIX}_PROPERTIES}
		QT_ANDROID_PACKAGE_SOURCE_DIR "${${A_PREFIX}_DIR_ROOT}/Platforms/android"
	)

	function(A_AddJavaPackage IN_SOURCE_PATH)

		get_filename_component(F_PACKAGE_NAME ${IN_SOURCE_PATH} NAME)
		set(F_DESTINATION_PATH ${${A_PREFIX}_ANDROID_DIR_SRC}/${F_PACKAGE_NAME})
		if(EXISTS ${F_DESTINATION_PATH})
			execute_process(COMMAND rm -f ${F_DESTINATION_PATH})
			if(NOT EXISTS ${F_DESTINATION_PATH})
				message(STATUS "Removed Java package: ${F_DESTINATION_PATH}")
			else()
				message(FATAL_ERROR "Can't remove Java package: ${F_DESTINATION_PATH}")
			endif()
		endif()
		execute_process(COMMAND ln -s ${IN_SOURCE_PATH} ${F_DESTINATION_PATH})
		if(EXISTS ${F_DESTINATION_PATH})
			message(STATUS "Added Java package: ${F_DESTINATION_PATH}")
		else()
			message(FATAL_ERROR "Can't add Java package: ${F_DESTINATION_PATH}")
		endif()

	endfunction()

	A_AddJavaPackage("${${A_PREFIX}_DIR_ROOT}/../../JavaPackage_v4/systems.arboreus.AJavaPackage")

endif()


## ----------------------------------------
## Qt Application settings

find_package(Qt6 REQUIRED COMPONENTS Core Quick)
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
		LibUsingJava_v4
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
