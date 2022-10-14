cmake_minimum_required(VERSION 3.14)

project(UsingObjectiveC_v1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
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

if(IOS)

	list(APPEND PROJECT_SOURCES
		aobjectivec.h
		aobjectivec.mm
	)

	add_compile_options(-x objective-c++)
	set(CMAKE_EXE_LINKER_FLAGS "
		-framework Foundation
		-framework UIKit
	")

	if(${CMAKE_OSX_SYSROOT} MATCHES "iphonesimulator")
		if (${CMAKE_OSX_ARCHITECTURES} MATCHES "arm64")
			message("-- iOS Build for simulator arm64")
		elseif(${CMAKE_OSX_ARCHITECTURES} MATCHES "x86_64")
			message("-- iOS Build for simulator x86_64")
		endif()
	elseif(${CMAKE_OSX_SYSROOT} MATCHES "iphoneos")
		message("-- iOS Build for iphone")
	else()
		message(FATAL_ERROR"-- iOS undefined build")
	endif()
elseif(ANDROID)
	if(${ANDROID_ABI} STREQUAL "x86_64")
		message("-- Android Build for x86_64")
	elseif(${ANDROID_ABI} STREQUAL "x86")
		message("-- Android Build for x86")
	elseif(${ANDROID_ABI} STREQUAL "armeabi-v7a")
		message("-- Android Build for armeabi-v7a")
	elseif(${ANDROID_ABI} STREQUAL "arm64-v8a")
		message("-- Android Build for arm64-v8a")
	else()
		message(FATAL_ERROR "-- Android undefined build")
	endif()
elseif(APPLE)
	if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")
		message("-- MacOS Build for x86_64")
	elseif(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "arm64")
		message("-- MacOS Build for arm64")
	else()
		message(FATAL_ERROR "-- MacOS undefined build")
	endif()
else()
	message(FATAL_ERROR "-- Undefined build")
endif()

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(UsingObjectiveC_v1
        ${PROJECT_SOURCES}
    )
else()
    if(ANDROID)
        add_library(UsingObjectiveC_v1 SHARED
            ${PROJECT_SOURCES}
        )
    else()
        add_executable(UsingObjectiveC_v1
          ${PROJECT_SOURCES}
        )
    endif()
endif()

target_compile_definitions(UsingObjectiveC_v1
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(UsingObjectiveC_v1
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick)
