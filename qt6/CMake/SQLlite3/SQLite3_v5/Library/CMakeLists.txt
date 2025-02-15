cmake_minimum_required(VERSION 3.16)

set(A_NAME_PROJECT "ALibrary")
set(A_DIR_ROOT ${CMAKE_CURRENT_LIST_DIR})

project(${A_NAME_PROJECT} LANGUAGES CXX C)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(A_SQLITE_CONF "${A_DIR_ROOT}/../../SQlite3.conf.cmake")
if(EXISTS ${A_SQLITE_CONF})
	message(STATUS "Found: ${A_SQLITE_CONF}")
	include(${A_SQLITE_CONF})
else()
	message(FATAL_ERROR "Can't find SQlite3.conf.cmake file: ${A_SQLITE_CONF}")
endif()

set(A_LIBRARIES
	Qt${QT_VERSION_MAJOR}::Core
)

if(IOS)

	set(A_LIBRARIES
		${A_LIBRARIES}
		"-framework Security"
	)

	if(${CMAKE_OSX_SYSROOT} MATCHES "iphonesimulator")

		# ----------------------
		# To fix bug https://bugreports.qt.io/browse/QTBUG-132830
		# set the CMAKE_OSX_ARCHITECTURES manualy
		set(CMAKE_OSX_ARCHITECTURES x86_64)

		message(STATUS "iOS Build for simulator")
	elseif(${CMAKE_OSX_SYSROOT} MATCHES "iphoneos")
		message(STATUS "iOS Build for iphone")
	else()
		message(FATAL_ERROR "iOS undefined build")
	endif()
elseif(ANDROID)
	if(${ANDROID_ABI} STREQUAL "x86_64")
		set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mvaes")
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mvaes")
		message(STATUS "Android Build for x86_64")
	elseif(${ANDROID_ABI} STREQUAL "x86")
		set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mvaes")
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mvaes")
		message(STATUS "Android Build for x86")
	elseif(${ANDROID_ABI} STREQUAL "armeabi-v7a")
		message(STATUS "Android Build for armeabi-v7a")
	elseif(${ANDROID_ABI} STREQUAL "arm64-v8a")
		set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=armv8-a+crypto")
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=armv8-a+crypto")
		message(STATUS "Android Build for arm64-v8a")
	else()
		message(FATAL_ERROR "Android undefined build")
	endif()
elseif(APPLE)

	set(A_LIBRARIES
		${A_LIBRARIES}
		"-framework Security"
	)

	if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")
		message(STATUS "MacOS Build for x86_64")
	elseif(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "arm64")
		message(STATUS "MacOS Build for arm64")
	else()
		message(FATAL_ERROR "MacOS undefined build")
	endif()
else()
	message(FATAL_ERROR "Undefined build")
endif()

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core)

add_library(${A_NAME_PROJECT} STATIC
	${A_DIR_ROOT}/alibrary.h ${A_DIR_ROOT}/alibrary.cpp
	${A_DIR_ROOT}/alibraryprivate.h ${A_DIR_ROOT}/alibraryprivate.cpp
	${A_SQLITE_SOURCES}
)

target_link_libraries(${A_NAME_PROJECT}
	PRIVATE
		${A_LIBRARIES}
)

target_include_directories(${A_NAME_PROJECT}
	PUBLIC
		${A_DIR_ROOT}
	PRIVATE
		${A_SQLITE_DIR}
)

target_compile_definitions(${A_NAME_PROJECT}
	PRIVATE
		LIBRARY_LIBRARY
)
