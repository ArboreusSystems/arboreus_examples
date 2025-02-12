cmake_minimum_required(VERSION 3.16)

set(A_NAME_TARGET UsingSwiftCPPInterop_v1)
set(A_DIR_MODULE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(A_DIR_SWIFT ${CMAKE_CURRENT_SOURCE_DIR}/Swift)

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)

project(${A_NAME_TARGET} LANGUAGES CXX Swift)

list(APPEND CMAKE_MODULE_PATH "${A_DIR_MODULE_ROOT}/CMake")
include(SwiftCPPInterop)

ACheckSwiftRequirements()
ASetupSwiftEnvironment()

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SOURCES_HEADERS
	${A_DIR_MODULE_ROOT}/Logger/alogger.h
)

set(SOURCES_CPP
	${A_DIR_MODULE_ROOT}/main.cpp
	${A_DIR_MODULE_ROOT}/Logger/alogger.cpp
)

set(SOURCES_SWIFT
	${A_DIR_MODULE_ROOT}/Swift/atestmodule.swift
)

set(SOURCES_PRECOMPILED_HEADERS_PUBLIC

)

set(SOURCES_PRECOMPILED_HEADERS_PRIVATE
	${A_DIR_MODULE_ROOT}/mainpch.h
)

set(SOURCES_OTHER

)

set(SOURCES
	${A_CMAKE_APPLICATION_CONF}
	${A_CMAKE_ENVIRONMENT_CONF}
	${SOURCES_HEADERS}
	${SOURCES_CPP}
	${SOURCES_SWIFT}
	${SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${SOURCES_OTHER}
)

include_directories(${A_DIR_SWIFT})

add_executable(${A_NAME_TARGET} ${SOURCES})
target_compile_options(${A_NAME_TARGET}
	PUBLIC
		"$<$<COMPILE_LANGUAGE:Swift>:-cxx-interoperability-mode=default>"
)

AGenerateSwiftHeaders(${A_NAME_TARGET} SwiftCPP.h SEARCH_PATHS ${A_DIR_SWIFT})

if(
	NOT ${SOURCES_PRECOMPILED_HEADERS_PUBLIC} EQUAL "" OR
	NOT ${SOURCES_PRECOMPILED_HEADERS_PRIVATE} EQUAL ""
)
	if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_OPTION_USING_PCH)
		message(STATUS "Using PCH for ${A_NAME_TARGET}")
		target_precompile_headers(${A_NAME_TARGET}
			PRIVATE ${PRECOMPILE_HEADERS_PRIVATE}
			PUBLIC ${PRECOMPILE_HEADERS_PUBLIC}
		)
		set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
	else()
		message(STATUS "No PCH for ${A_NAME_TARGET}")
	endif()
endif()
