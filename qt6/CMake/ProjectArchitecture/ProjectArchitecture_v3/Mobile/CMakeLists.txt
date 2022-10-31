cmake_minimum_required(VERSION 3.14)

set(A_NAME_TARGET Mobile)
set(A_DIR_TARGET_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

project(${A_NAME_TARGET} LANGUAGES CXX)

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(A_QT_MODULES)
set(A_QT_MODULE_TARGETS)

set(A_SOURCES_RESOURCES)
set(A_SOURCES_HEADERS)
set(A_SOURCES_CPP)
set(A_SOURCES_PRECOMPILED_HEADERS_PUBLIC)
set(A_SOURCES_PRECOMPILED_HEADERS_PRIVATE)

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

set(A_CONF_PROJECT "../ProjectArchitecture.conf.cmake")
if(EXISTS ${A_CONF_PROJECT})
	include(${A_CONF_PROJECT})
	message(STATUS "Added project configuration file for ${A_NAME_TARGET}: ${A_CONF_PROJECT}")
else()
	message(FATAL_ERROR "No project configuration file for ${A_NAME_TARGET}: ${A_CONF_PROJECT}")
endif()

set(A_CMAKE_PROJECT "${A_DIR_TARGET_ROOT}/Mobile.cmake")
if(EXISTS ${A_CMAKE_PROJECT})
	include(${A_CMAKE_PROJECT})
	message(STATUS "Added target Cmake file for ${A_NAME_TARGET}: ${A_CMAKE_PROJECT}")
else()
	message(FATAL_ERROR "No target Cmake file for ${A_NAME_TARGET}: ${A_CMAKE_PROJECT}")
endif()

set(A_SOURCES_RESOURCES
	${A_SOURCES_RESOURCES}
	${A_DIR_TARGET_ROOT}/qml.qrc
)

set(A_SOURCES_CPP
	${A_SOURCES_CPP}
	${A_DIR_TARGET_ROOT}/main.cpp
)

set(A_SOURCES
	${A_CMAKE_APPLICATION_CONF}
	${A_CMAKE_ENVIRONMENT_CONF}
	${A_SOURCES_RESOURCES}
	${A_SOURCES_CPP}
	${A_SOURCES_HEADERS}
	${A_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
)

foreach(I_MODULE IN LISTS A_QT_MODULES)
	list(APPEND A_QT_MODULE_TARGETS
		Qt${QT_VERSION_MAJOR}::${I_MODULE}
	)
endforeach()

find_package(QT NAMES Qt6 Qt5 COMPONENTS ${A_QT_MODULES} REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS ${A_QT_MODULES} REQUIRED)

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
	PUBLIC
)

target_link_libraries(${A_NAME_TARGET}
	PRIVATE
		${A_QT_MODULE_TARGETS}
	PUBLIC
)
