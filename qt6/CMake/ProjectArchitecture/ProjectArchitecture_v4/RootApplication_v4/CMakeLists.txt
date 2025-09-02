cmake_minimum_required(VERSION 3.16)


## ---------------------------------
## Global setings

set(A_TARGET_NAME RootApplication_v4)
set(A_APPLICATION_NAME APP_${A_TARGET_NAME})
set(A_PREFIX A_${A_NAME_TARGET})

project(${A_TARGET_NAME} VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)


## ---------------------------------
## Project variables

set(${A_PREFIX}_SOURCES)
set(${A_PREFIX}_SOURCES_RESOURCES)
set(${A_PREFIX}_SOURCES_CPP_HEADERS)
set(${A_PREFIX}_SOURCES_CPP)
set(${A_PREFIX}_SOURCES_C_HEADERS)
set(${A_PREFIX}_SOURCES_C)
set(${A_PREFIX}_SOURCES_QML)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE)


## ---------------------------------
## Project sources

set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	rootapplication_v4_pch.h
)

set(${A_PREFIX}_SOURCES_CPP
	${${A_PREFIX}_SOURCES_CPP}
	main.cpp
)

set(${A_PREFIX}_SOURCES_QML
	${${A_PREFIX}_SOURCES_QML}
	Main.qml
)


## ---------------------------------
## Package settings

find_package(Qt6 REQUIRED COMPONENTS Quick)


## ---------------------------------
## Project

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(${A_APPLICATION_NAME}
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${${A_PREFIX}_SOURCES_CPP}
)

qt_add_qml_module(${A_APPLICATION_NAME}
	URI ${A_TARGET_NAME}
    VERSION 1.0
	QML_FILES ${${A_PREFIX}_SOURCES_QML}
)


## ---------------------------------
## Libraries

add_subdirectory(Library1_v4)
add_subdirectory(Library2_v4)
add_subdirectory(Library3_v4)


## ---------------------------------
## Project settings

set_target_properties(${A_APPLICATION_NAME} PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appApplication_v4
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

if(
	NOT "${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}" STREQUAL "" OR
	NOT "${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}" STREQUAL ""
)
	if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_OPTION_USING_PCH)
		message(STATUS "Using PCH for ${A_APPLICATION_NAME}")
		target_precompile_headers(${A_APPLICATION_NAME}
			PRIVATE ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
			PUBLIC ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
		)
		set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
	else()
		message(STATUS "No PCH for ${A_APPLICATION_NAME}")
	endif()
else()
	message(STATUS "PCH list empty.")
endif()

target_link_libraries(${A_APPLICATION_NAME}
	PRIVATE
		Qt6::Quick
		Library1_v4
		Library2_v4
		Library3_v4
)

