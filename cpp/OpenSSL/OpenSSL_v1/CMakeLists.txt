cmake_minimum_required(VERSION 3.16)

## ---------------------------------
## Global settings

set(A_TARGET_NAME OpenSSL_v1)
set(A_PREFIX A_${A_NAME_TARGET})

project(${A_TARGET_NAME} LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)


## ---------------------------------
## Project variables

set(${A_PREFIX}_DIR_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

set(${A_PREFIX}_SOURCES)
set(${A_PREFIX}_SOURCES_CPP_HEADERS)
set(${A_PREFIX}_SOURCES_CPP)
set(${A_PREFIX}_SOURCES_C_HEADERS)
set(${A_PREFIX}_SOURCES_C)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE)


## ---------------------------------
## Project sources

set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	main_pch.h
)

set(${A_PREFIX}_SOURCES_CPP
	${${A_PREFIX}_SOURCES_CPP}
	main.cpp
)

set(${A_PREFIX}_SOURCES
	${${A_PREFIX}_SOURCES}
	${${A_PREFIX}_SOURCES_CPP_HEADERS}
	${${A_PREFIX}_SOURCES_CPP}
	${${A_PREFIX}_SOURCES_C_HEADERS}
	${${A_PREFIX}_SOURCES_C}
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
)


## ---------------------------------
## Project

add_executable(${A_TARGET_NAME} ${${A_PREFIX}_SOURCES})

target_include_directories(${A_TARGET_NAME}
	PRIVATE
		${${A_PREFIX}_DIR_ROOT}
)

if(APPLE)
	find_package(OpenSSL REQUIRED)
	target_link_libraries(${A_TARGET_NAME}
		OpenSSL::SSL
	)
endif()


## ---------------------------------
## Precompiled headers

if(
	NOT "${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}" STREQUAL "" OR
	NOT "${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}" STREQUAL ""
)
	if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_OPTION_USING_PCH)
		message(STATUS "Using PCH for ${A_TARGET_NAME}")
		target_precompile_headers(${A_TARGET_NAME}
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
