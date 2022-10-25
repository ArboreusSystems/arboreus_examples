cmake_minimum_required(VERSION 3.14)

set(A_NAME_TARGET Desktop)
set(A_DIR_MODULE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

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

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick REQUIRED)

set(A_CMAKE_APPLICATION_CONF "../Application.conf.cmake")
if(EXISTS "${A_CMAKE_APPLICATION_CONF}")
	include("${A_CMAKE_APPLICATION_CONF}")
	message(STATUS "Included application config file")
else()
	message(FATAL_ERROR "No Application config file")
endif()

set(SOURCES_RESOURCES
	${A_DIR_MODULE_ROOT}/qml.qrc
)

set(SOURCES_CPP
	${A_DIR_MODULE_ROOT}/main.cpp
)

set(SOURCES_HEADERS

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

set(A_DIR_MODULES_BINARY_LIBRARIES ${A_DIR_BINARY_LIBRARIES}/Modules)
if(EXISTS ${A_DIR_MODULES})
	add_subdirectory(${A_DIR_MODULES} ${A_DIR_MODULES_BINARY_LIBRARIES})
else()
	message(FATAL_ERROR "No Modules cmake file: ${A_DIR_MODULES}")
endif()

set(A_DIR_3D_PART_BINARY_LIBRARIES ${A_DIR_BINARY_LIBRARIES}/3dPart)
if(EXISTS ${A_DIR_3D_PART})
	add_subdirectory(${A_DIR_3D_PART} ${A_DIR_3D_PART_BINARY_LIBRARIES})
else()
	message(FATAL_ERROR "No 3d Part cmake file: ${A_DIR_MODULES}")
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

if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_OPTION_USING_PCH)
	message(STATUS "Using PCH for ${A_NAME_TARGET}")
	target_precompile_headers(${A_NAME_TARGET}
		PRIVATE ${PRECOMPILED_HEADERS_PRIVATE}
		PUBLIC ${PRECOMPILED_HEADERS_PUBLIC}
	)
	set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
else()
	message(STATUS "No PCH for ${A_NAME_TARGET}")
endif()

target_compile_definitions(${A_NAME_TARGET}
	PRIVATE
		$<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)

target_link_libraries(${A_NAME_TARGET}
	PRIVATE
		Qt${QT_VERSION_MAJOR}::Core
		Qt${QT_VERSION_MAJOR}::Quick
	PUBLIC
		AModules
)
