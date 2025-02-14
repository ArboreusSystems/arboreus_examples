cmake_minimum_required(VERSION 3.16)

set(A_NAME_TAREGT SQLite3_v2)
set(A_NAME_APPLICATION app${A_NAME_TAREGT})

project(${A_NAME_TAREGT} VERSION 0.1 LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(A_DIR_ROOT ${CMAKE_SOURCE_DIR})

set(A_SQLITE_CONF "${A_DIR_ROOT}/../SQlite3.conf.cmake")
if(EXISTS ${A_SQLITE_CONF})
	message(STATUS "Found: ${A_SQLITE_CONF}")
	include(${A_SQLITE_CONF})
else()
	message(FATAL_ERROR "Can't find SQlite3.conf.cmake file: ${A_SQLITE_CONF}")
endif()

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

set(A_LIBRARIES
	Qt6::Quick
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

qt_add_executable(${A_NAME_APPLICATION}
    main.cpp
	${A_SQLITE_SOURCES}
)

qt_add_qml_module(${A_NAME_APPLICATION}
	URI SQLite3_v1
	VERSION 1.0
    QML_FILES
        Main.qml
	SOURCES
		${A_DIR_ROOT}/../sqlite.conf.h
		SQLite/asqlite.h SQLite/asqlite.cpp
)

target_include_directories(${A_NAME_APPLICATION}
	PRIVATE
		${A_SQLITE_DIR}
		${A_DIR_ROOT}/..
		${A_DIR_ROOT}/SQLite
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${A_NAME_APPLICATION} PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appSQLite3_v1
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${A_NAME_APPLICATION}
	PRIVATE
		${A_LIBRARIES}
)
