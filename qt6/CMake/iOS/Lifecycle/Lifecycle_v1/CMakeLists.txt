cmake_minimum_required(VERSION 3.14)

set(A_NAME_TARGET Lifecycle_v1)
set(A_DIR_MODULE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(A_DIR_MODULES_BINARY_LIBRARIES "${CMAKE_CURRENT_BINARY_DIR}/${A_NAME_TARGET}_libraries")

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)

project(${A_NAME_TARGET} LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(A_QT_MODULES)
set(A_QT_MODULE_TARGETS)

set(A_TARGET_MODULES_PUBLIC)
set(A_TARGET_MODULES_PRIVATE)

set(A_SOURCES_RESOURCES)
set(A_SOURCES_HEADERS)
set(A_SOURCES_CPP)
set(A_SOURCES_PRECOMPILED_HEADERS_PUBLIC)
set(A_SOURCES_PRECOMPILED_HEADERS_PRIVATE)

if(IOS)
	set(A_SOURCES_OBJECTIVE_HEADERS)
	set(A_SOURCES_OBJECTIVE_CPP)
endif()

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

set(A_QT_MODULES
	${A_QT_MODULES}
	Core
	Quick
)

set(A_TARGET_MODULES_PUBLIC
	${A_TARGET_MODULES}
	ALogger
	ABackend
	AConfig
)

set(A_QT_TARGET_MODULES
	Qt${QT_VERSION_MAJOR}::Core
	Qt${QT_VERSION_MAJOR}::Quick
)

set(A_SOURCES_RESOURCES
	${A_SOURCES_RESOURCES}
	${A_DIR_MODULE_ROOT}/qml.qrc
)

set(A_SOURCES_CPP
	${A_SOURCES_CPP}
	${A_DIR_MODULE_ROOT}/main.cpp
)

set(A_SOURCES_PRECOMPILED_HEADERS_PRIVATE
	${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${A_DIR_MODULE_ROOT}/mainpch.h
)

foreach(I_MODULE IN LISTS A_QT_MODULES)
	set(A_QT_MODULE_TARGETS
		${A_QT_MODULE_TARGETS}
		Qt${QT_VERSION_MAJOR}::${I_MODULE}
	)
endforeach()

find_package(QT NAMES Qt6 Qt5 COMPONENTS ${A_QT_MODULES} REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS ${A_QT_MODULES} REQUIRED)

set(A_DIR_MODULE_APPLICATION ${A_DIR_MODULE_ROOT}/cpp/Application)
if(IOS)
	set(A_CMAKE_MODULE_APPLICATION ${A_DIR_MODULE_APPLICATION}/Application.cmake)
	if(EXISTS ${A_CMAKE_MODULE_APPLICATION})
		include(${A_CMAKE_MODULE_APPLICATION})
		message(STATUS "Included cmake module: AApplication")
	else()
		message(FATAL_ERROR "No cmake AApplication file for include: ${A_DIR_MODULE_APPLICATION}")
	endif()
endif()
if(EXISTS ${A_DIR_MODULE_APPLICATION})
	add_subdirectory(${A_DIR_MODULE_APPLICATION} ${A_DIR_MODULES_BINARY_LIBRARIES}/Application)
	message(STATUS "Added module: AApplication")
else()
	message(FATAL_ERROR "No Module AApplication cmake file: ${A_DIR_MODULE_APPLICATION}")
endif()

set(A_DIR_MODULE_BACKEND ${A_DIR_MODULE_ROOT}/cpp/Backend)
if(EXISTS ${A_DIR_MODULE_BACKEND})
	add_subdirectory(${A_DIR_MODULE_BACKEND} ${A_DIR_MODULES_BINARY_LIBRARIES}/Backend)
	message(STATUS "Added module: ABackend")
else()
	message(FATAL_ERROR "No Module ABackend cmake file: ${A_DIR_MODULE_BACKEND}")
endif()

set(A_DIR_MODULE_CONFIG ${A_DIR_MODULE_ROOT}/cpp/Config)
if(EXISTS ${A_DIR_MODULE_CONFIG})
	add_subdirectory(${A_DIR_MODULE_CONFIG} ${A_DIR_MODULES_BINARY_LIBRARIES}/Config)
	message(STATUS "Added module: AConfig")
else()
	message(FATAL_ERROR "No Module AConfig cmake file: ${A_DIR_MODULE_CONFIG}")
endif()

set(A_DIR_MODULE_LOGGER ${A_DIR_MODULE_ROOT}/cpp/Logger)
if(EXISTS ${A_DIR_MODULE_LOGGER})
	add_subdirectory(${A_DIR_MODULE_LOGGER} ${A_DIR_MODULES_BINARY_LIBRARIES}/Logger)
	message(STATUS "Added module: ALogger")
else()
	message(FATAL_ERROR "No Module ALogger cmake file: ${A_DIR_MODULE_LOGGER}")
endif()

set(A_DIR_MODULE_TEMPLATES ${A_DIR_MODULE_ROOT}/cpp/Templates)
if(EXISTS ${A_DIR_MODULE_TEMPLATES})
	add_subdirectory(${A_DIR_MODULE_TEMPLATES} ${A_DIR_MODULES_BINARY_LIBRARIES}/Templates)
	message(STATUS "Added module: ATemplates")
else()
	message(FATAL_ERROR "No Module ATemplates cmake file: ${A_DIR_MODULE_TEMPLATES}")
endif()

set(A_SOURCES
	${A_SOURCES}
	${A_CMAKE_APPLICATION_CONF}
	${A_CMAKE_ENVIRONMENT_CONF}
	${A_SOURCES_RESOURCES}
	${A_SOURCES_HEADERS}
	${A_SOURCES_CPP}
	${A_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
)

if(IOS)
	set(A_SOURCES
		${A_SOURCES}
		${A_SOURCES_OBJECTIVE_HEADERS}
		${A_SOURCES_OBJECTIVE_CPP}
	)
endif()

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
	qt_add_executable(${A_NAME_TARGET}
		${A_SOURCES}
	)
else()
	if(ANDROID)
		add_library(${A_NAME_TARGET}
			SHARED
				${A_SOURCES}
		)
	else()
		add_executable(${A_NAME_TARGET}
			${A_SOURCES}
		)
	endif()
endif()

if(
	NOT ${A_SOURCES_PRECOMPILED_HEADERS_PUBLIC} EQUAL "" OR
	NOT ${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE} EQUAL ""
)
	if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_OPTION_USING_PCH)
		message(STATUS "Using PCH for ${A_NAME_TARGET}")
		target_precompile_headers(${A_NAME_TARGET}
			PRIVATE ${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
			PUBLIC ${A_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
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
		${A_TARGET_MODULES_PRIVATE}
	PUBLIC
		${A_TARGET_MODULES_PUBLIC}
)
