cmake_minimum_required(VERSION 3.14)

set(A_DIR_MODULE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(A_NAME_TARGET AModules)

option(A_OPTION_USING_PCH "Modules using PCH support" ON)

set(SOURCES_CPP

)

set(SOURCES_HEADERS

)

set(SOURCES_PRECOMPILE_HEADERS_PUBLIC

)

set(SOURCES_PRECOMPILE_HEADERS_PRIVATE

)

set(SOURCES
	${SOURCES_CPP}
	${SOURCES_HEADERS}
	${SOURCES_PRECOMPILE_HEADERS_PUBLIC}
	${SOURCES_PRECOMPILE_HEADERS_PRIVATE}
)

add_library(${A_NAME_TARGET} STATIC ${SOURCES})

set(A_DIR_MODULE_LOGGER ${A_DIR_MODULE_ROOT}/Logger)
if(EXISTS ${A_DIR_MODULE_LOGGER})
	add_subdirectory(${A_DIR_MODULE_LOGGER} ${A_DIR_MODULES_BINARY_LIBRARIES}/Logger)
	message(STATUS "Added module: ALogger")
else()
	message(FATAL_ERROR "No Module ALogger cmake file: ${A_DIR_MODULE_LOGGER}")
endif()

set(A_DIR_MODULE_BACKEND ${A_DIR_MODULE_ROOT}/Backend)
if(EXISTS ${A_DIR_MODULE_BACKEND})
	add_subdirectory(${A_DIR_MODULE_BACKEND} ${A_DIR_MODULES_BINARY_LIBRARIES}/Backend)
	message(STATUS "Added module: ABackend")
else()
	message(FATAL_ERROR "No Module ALogger cmake file: ${A_DIR_MODULE_BACKEND}")
endif()

set(A_DIR_MODULE_TEMPLATES ${A_DIR_MODULE_ROOT}/Templates)
if(EXISTS ${A_DIR_MODULE_TEMPLATES})
	add_subdirectory(${A_DIR_MODULE_TEMPLATES} ${A_DIR_MODULES_BINARY_LIBRARIES}/Templates)
	message(STATUS "Added module: ATemplates")
else()
	message(FATAL_ERROR "No Module AUniversal cmake file: ${A_DIR_MODULE_TEMPLATES}")
endif()

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

target_include_directories(${A_NAME_TARGET} PUBLIC ${A_DIR_MODULE_ROOT})
target_link_libraries(${A_NAME_TARGET}
	PRIVATE
		Qt${QT_VERSION_MAJOR}::Core
		Qt${QT_VERSION_MAJOR}::Quick
	PUBLIC
		ALogger
		ABackend
)
