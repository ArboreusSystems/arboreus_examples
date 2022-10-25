cmake_minimum_required(VERSION 3.14)

set(A_DIR_MODULE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(A_NAME_TARGET a_libone)

set(SOURCES
	${A_DIR_MODULE_ROOT}/libone.cpp
	${A_DIR_MODULE_ROOT}/libone.h
	${A_DIR_MODULE_ROOT}/libonepch.h
)

set(PRECOMPILE_HEADERS_PUBLIC
	${A_DIR_MODULE_ROOT}/libonepch.h
)

set(PRECOMPILE_HEADERS_PRIVATE

)

add_library(${A_NAME_TARGET} STATIC ${SOURCES})

# Precompiled headers functionality based on video from KDAB
# https://youtu.be/a6PdfwVE9hA

option(A_LIB1_USING_PCH "Build using PCH support" ON)
if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_LIB1_USING_PCH)
	message(STATUS "Using PCH for Lib1")
	target_precompile_headers(${A_NAME_TARGET}
		PRIVATE ${PRECOMPILE_HEADERS_PRIVATE}
		PUBLIC ${PRECOMPILE_HEADERS_PUBLIC}
	)
	set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
else()
	message(STATUS "No PCH for Lib1")
endif()

target_include_directories(${A_NAME_TARGET} PUBLIC ${A_DIR_MODULE_ROOT})
target_link_libraries(${A_NAME_TARGET}
	PRIVATE
		Qt${QT_VERSION_MAJOR}::Core
		Qt${QT_VERSION_MAJOR}::Quick
	PUBLIC
		a_libtwo
)
