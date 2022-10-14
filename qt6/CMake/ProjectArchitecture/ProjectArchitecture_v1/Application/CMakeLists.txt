cmake_minimum_required(VERSION 3.14)

set(A_TARGET_NAME ProjectArchitecture_v1)
set(A_TARGET_DIR_BINARY ${CMAKE_BINARY_DIR})
set(A_TARGET_DIR_BINARY_LIBRARIES ${CMAKE_BINARY_DIR}/Libraries)

project(${A_TARGET_NAME} LANGUAGES CXX)

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

set(PROJECT_SOURCES
	main.cpp
	qml.qrc
)

set(A_DIR_ROOT ${CMAKE_CURRENT_LIST_DIR})

set(A_PROJECT_CONF "../ProjectArchitecture_v1_conf.cmake")
if(EXISTS "${A_PROJECT_CONF}")
	include("${A_PROJECT_CONF}")
else()
	message(FATAL_ERROR "No ProjectArchitecture_v1 config file")
endif()

if(EXISTS ${A_DIR_MODULE_LIB1})
	add_subdirectory(${A_DIR_MODULE_LIB1} ${A_TARGET_DIR_BINARY_LIBRARIES}/lib1)
else()
	message(FATAL_ERROR "No Lib1 cmake file: ${A_DIR_MODULE_LIB1}")
endif()

if(EXISTS "${A_DIR_MODULE_LIB2}")
	add_subdirectory(${A_DIR_MODULE_LIB2} ${A_TARGET_DIR_BINARY_LIBRARIES}/lib2)
else()
	message(FATAL_ERROR "No Lib1 cmake file: ${A_DIR_MODULE_LIB2}")
endif()

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
	qt_add_executable(${A_TARGET_NAME}
		${PROJECT_SOURCES}
	)
else()
	if(ANDROID)
		add_library(${A_TARGET_NAME} SHAREDMk
			${PROJECT_SOURCES}
		)
	else()
		add_executable(${A_TARGET_NAME}
			${PROJECT_SOURCES}
		)
	endif()
endif()

target_compile_definitions(${A_TARGET_NAME}
	PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)

target_include_directories(${A_TARGET_NAME} SYSTEM
	PUBLIC ${PROJECT_INCLUDES_PUBLIC}
	PRIVATE ${PROJECT_INCLUDES_PRIVATE}
)

target_link_libraries(${A_TARGET_NAME}
	PRIVATE
		Qt${QT_VERSION_MAJOR}::Core
		Qt${QT_VERSION_MAJOR}::Quick
	PUBLIC
		a_libone
		a_libtwo
)
