cmake_minimum_required(VERSION 3.16)

set(A_NAME_TARGET LinearRegression_v1)
set(A_DIR_MODULE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(A_DIR_MODULES_BINARY_LIBRARIES "${CMAKE_CURRENT_BINARY_DIR}/${A_NAME_TARGET}_libraries")

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)

project(${A_NAME_TARGET} LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(A_GLOBAL_CONF "${A_DIR_MODULE_ROOT}/../../../Global.conf.cmake")
if(EXISTS "${A_GLOBAL_CONF}")
	include("${A_GLOBAL_CONF}")
	message(STATUS "Global config file included: ${A_GLOBAL_CONF}")
else()
	message(FATAL_ERROR "No Global config file: ${A_GLOBAL_CONF}")
endif()

set(Boost_INCLUDE_DIR "${A_DIR_BOOST_1_86}")
set(Boost_LIBRARY_DIR "${Boost_INCLUDE_DIR}/libs")
set(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "${Boost_INCLUDE_DIR}")
set(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} "${Boost_LIBRARY_DIR}")
find_package(Boost 1.86.0 REQUIRED)
if(Boost_FOUND)
	message(STATUS "Boost found")
	include_directories(${Boost_INCLUDE_DIR})
	add_definitions( "-DHAS_BOOST" )
endif()

find_package(Eigen3 3.3 REQUIRED NO_MODULE)
if(Eigen3_FOUND)
	message(STATUS "Eigen3 found")
	include_directories(${Eigen3_INCLUDE_DIR})
endif()

set(SOURCES_HEADERS
	${A_DIR_MODULE_ROOT}/Logger/alogger.h
	${A_DIR_MODULE_ROOT}/ML/aetl.h
	${A_DIR_MODULE_ROOT}/ML/alinearregression.h
)

set(SOURCES_CPP
	${A_DIR_MODULE_ROOT}/main.cpp
	${A_DIR_MODULE_ROOT}/Logger/alogger.cpp
	${A_DIR_MODULE_ROOT}/ML/aetl.cpp
	${A_DIR_MODULE_ROOT}/ML/alinearregression.cpp
)

set(SOURCES_PRECOMPILED_HEADERS_PUBLIC

)

set(SOURCES_PRECOMPILED_HEADERS_PRIVATE
	${A_DIR_MODULE_ROOT}/mainpch.h
)

set(SOURCES_OTHER
	${A_DIR_MODULE_ROOT}/Data/data.csv
)

set(SOURCES
	${A_CMAKE_APPLICATION_CONF}
	${A_CMAKE_ENVIRONMENT_CONF}
	${SOURCES_HEADERS}
	${SOURCES_CPP}
	${SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${SOURCES_OTHER}
)

add_executable(${A_NAME_TARGET}
	${SOURCES}
)

target_link_libraries(${A_NAME_TARGET} Eigen3::Eigen)

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
