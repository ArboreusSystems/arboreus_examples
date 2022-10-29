cmake_minimum_required(VERSION 3.14)

set(A_NAME_TARGET ApplicationDelegate_v1)
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

set(A_QT_MODULES
	Core
	Quick
)

set(A_QT_TARGET_MODULES
	Qt${QT_VERSION_MAJOR}::Core
	Qt${QT_VERSION_MAJOR}::Quick
)

find_package(QT NAMES Qt6 Qt5 COMPONENTS ${A_QT_MODULES} REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS ${A_QT_MODULES} REQUIRED)

set(SOURCES_RESOURCES
	${A_DIR_MODULE_ROOT}/qml.qrc
)

set(SOURCES_HEADERS
	${A_DIR_MODULE_ROOT}/cpp/ApplicationDelegate/aapplicationdelegate.h
)

set(SOURCES_CPP
	${A_DIR_MODULE_ROOT}/main.cpp
	${A_DIR_MODULE_ROOT}/cpp/ApplicationDelegate/aapplicationdelegate.mm
)

set(SOURCES_PRECOMPILED_HEADERS_PUBLIC

)

set(SOURCES_PRECOMPILED_HEADERS_PRIVATE
#	${A_DIR_MODULE_ROOT}/mainpch.h
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

set(A_DIR_MODULE_LOGGER ${A_DIR_MODULE_ROOT}/cpp/Logger)
if(EXISTS ${A_DIR_MODULE_LOGGER})
	add_subdirectory(${A_DIR_MODULE_LOGGER} ${A_DIR_MODULES_BINARY_LIBRARIES}/Logger)
	message(STATUS "Added module: ALogger")
else()
	message(FATAL_ERROR "No Module ALogger cmake file: ${A_DIR_MODULE_LOGGER}")
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
		ALogger
)
