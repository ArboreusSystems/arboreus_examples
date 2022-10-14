cmake_minimum_required(VERSION 3.14)

set(A_DIR_MODULE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(A_NAME_TARGET a_libtwo)

set(SOURCES
	${A_DIR_MODULE_ROOT}/libtwo.cpp
	${A_DIR_MODULE_ROOT}/libtwo.h
)

add_library(${A_NAME_TARGET} STATIC ${SOURCES})
target_include_directories(${A_NAME_TARGET} PUBLIC ${A_DIR_MODULE_ROOT})
target_link_libraries(${A_NAME_TARGET}
	PRIVATE
		Qt${QT_VERSION_MAJOR}::Core
		Qt${QT_VERSION_MAJOR}::Quick
	PUBLIC
		a_libone
)
