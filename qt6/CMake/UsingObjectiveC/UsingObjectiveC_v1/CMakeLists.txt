cmake_minimum_required(VERSION 3.14)

set(A_NAME_TARGET UsingObjectiveC_v1)
set(A_DIR_MODULE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(A_DIR_MODULES_BINARY_LIBRARIES "${CMAKE_CURRENT_BINARY_DIR}/${A_NAME_TARGET}_libraries")

project(${A_NAME_TARGET} LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check https://doc.qt.io/qt/deployment-android.html for more information.
# They need to be set before the find_package(...) calls below.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so)
#    endif()
#endif()

set (A_QT_MODULES
	Core
	Quick
)

set (A_QT_TARGET_MODULES
	Qt${QT_VERSION_MAJOR}::Core
	Qt${QT_VERSION_MAJOR}::Quick
)

find_package(QT NAMES Qt6 Qt5 COMPONENTS ${A_QT_MODULES} REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS ${A_QT_MODULES} REQUIRED)

set(SOURCES_RESOURCES
	${A_DIR_MODULE_ROOT}/qml.qrc
)

set(SOURCES_HEADERS

)

set(SOURCES_CPP
	${A_DIR_MODULE_ROOT}/main.cpp
)

set(SOURCES_PRECOMPILED_HEADERS_PUBLIC

)

set(SOURCES_PRECOMPILED_HEADERS_PRIVATE
	${A_DIR_MODULE_ROOT}/mainpch.h
)

set(SOURCES
	${A_CMAKE_APPLICATION_CONF}
	${A_CMAKE_ENVIRONMENT_CONF}
	${SOURCES_RESOURCES}
	${SOURCES_CPP}
	${SOURCES_HEADERS}
	${SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${SOURCES_PRECOMPILED_HEADERS_PRIVATE}
)

if(IOS)

	set(A_DIR_MODULE_OBJECTIVE_C ${A_DIR_MODULE_ROOT}/cpp/ObjectiveC)
	if(EXISTS ${A_DIR_MODULE_OBJECTIVE_C})
		add_subdirectory(${A_DIR_MODULE_OBJECTIVE_C} ${A_DIR_MODULES_BINARY_LIBRARIES}/ObjectiveC)
		message(STATUS "Added module: AObjectiveC")
	else()
		message(FATAL_ERROR "No Module AObjectiveC cmake file: ${A_DIR_MODULE_OBJECTIVE_C}")
	endif()

	set(SOURCES_OBJECTIVE_HEADERS

	)

	set(SOURCES_OBJECTIVE_CPP

	)

	list(APPEND SOURCES
		${SOURCES_OBJECTIVE_HEADERS}
		${SOURCES_OBJECTIVE_CPP}
	)

	add_compile_options(-x objective-c++)
	set(CMAKE_EXE_LINKER_FLAGS "
		-framework Foundation
		-framework UIKit
	")

	if(${CMAKE_OSX_SYSROOT} MATCHES "iphonesimulator")
		if (${CMAKE_OSX_ARCHITECTURES} MATCHES "arm64")
			message(STATUS "iOS Build for simulator arm64")
		elseif(${CMAKE_OSX_ARCHITECTURES} MATCHES "x86_64")
			message(STATUS "iOS Build for simulator x86_64")
		endif()
	elseif(${CMAKE_OSX_SYSROOT} MATCHES "iphoneos")
		message(STATUS "iOS Build for iphone")
	else()
		message(FATAL_ERROR "iOS undefined build")
	endif()
elseif(ANDROID)
	if(${ANDROID_ABI} STREQUAL "x86_64")
		message(STATUS "Android Build for x86_64")
	elseif(${ANDROID_ABI} STREQUAL "x86")
		message(STATUS "Android Build for x86")
	elseif(${ANDROID_ABI} STREQUAL "armeabi-v7a")
		message(STATUS "Android Build for armeabi-v7a")
	elseif(${ANDROID_ABI} STREQUAL "arm64-v8a")
		message(STATUS "Android Build for arm64-v8a")
	else()
		message(FATAL_ERROR "Android undefined build")
	endif()
elseif(APPLE)
	if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")
		message(STATUS "MacOS Build for x86_64")
	elseif(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "arm64")
		message(STATUS "MacOS Build for arm64")
	else()
		message(FATAL_ERROR "MacOS undefined build")
	endif()
else()
	message(FATAL_ERROR "-- Undefined build")
endif()

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
	qt_add_executable(${A_NAME_TARGET}
		${SOURCES}
	)
else()
	if(ANDROID)
		add_library(${A_NAME_TARGET}
			SHARED
				${SOURCES}
		)
	else()
		add_executable(${A_NAME_TARGET}
			${SOURCES}
		)
	endif()
endif()

set(A_DIR_MODULE_LOGGER ${A_DIR_MODULE_ROOT}/cpp/Logger)
if(EXISTS ${A_DIR_MODULE_LOGGER})
	add_subdirectory(${A_DIR_MODULE_LOGGER} ${A_DIR_MODULES_BINARY_LIBRARIES}/Logger)
	message(STATUS "Added module: ALogger")
else()
	message(FATAL_ERROR "No Module ALogger cmake file: ${A_DIR_MODULE_LOGGER}")
endif()

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

target_compile_definitions(${A_NAME_TARGET}
	PRIVATE
		$<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)

target_link_libraries(${A_NAME_TARGET}
	PRIVATE
		${A_QT_TARGET_MODULES}
	PUBLIC

)
