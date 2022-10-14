cmake_minimum_required(VERSION 3.14)
set(A_TARGET_NAME CMake_Boost_v1)

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

set(A_GLOBALQT6_CONF "../../../GlobalQt6.conf.cmake")
if(EXISTS "${A_GLOBALQT6_CONF}")
	include("${A_GLOBALQT6_CONF}")
else()
	message(FATAL_ERROR "No GlobalQt6 config file")
endif()

set(Boost_INCLUDE_DIR "${A_DIR_BOOST_1_80}")
set(Boost_LIBRARY_DIR "${Boost_INCLUDE_DIR}/libs")
set(CMAKE_INCLUDE_PATH ${CMAKE_INCLUDE_PATH} "${Boost_INCLUDE_DIR}")
set(CMAKE_LIBRARY_PATH ${CMAKE_LIBRARY_PATH} "${Boost_LIBRARY_DIR}")
find_package(Boost 1.80.0 REQUIRED)
if(Boost_FOUND)
	include_directories(${Boost_INCLUDE_DIR})
	add_definitions( "-DHAS_BOOST" )
endif()

set(FILES_UNIVERSAL_HEADERS
#	${CMAKE_CURRENT_SOURCE_DIR}/cpp/Asio/aasio.h
	${CMAKE_CURRENT_SOURCE_DIR}/cpp/Logger/alogger.h
)

set(FILES_UNIVERSAL_CPP
	main.cpp
#	${CMAKE_CURRENT_SOURCE_DIR}/cpp/Asio/aasio.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/cpp/Logger/alogger.cpp
)

set(FILES_UNIVERSAL_RESOURCES
	qml.qrc
)

set(FILES_ANDROID_HEADERS
	alogger0.h
)

set(FILES_ANDROID_CPP

)

set(FILES_IOS_HEADERS

)

set(FILES_IOS_CPP

)

set(FILES_IOS_OBJECTIVE

)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
	qt_add_executable(${A_TARGET_NAME}
		${FILES_UNIVERSAL_HEADERS}
		${FILES_UNIVERSAL_CPP}
		${FILES_UNIVERSAL_RESOURCES}
    )
else()
    if(ANDROID)
		add_library(${A_TARGET_NAME} SHARED
			${FILES_UNIVERSAL_HEADERS}
			${FILES_UNIVERSAL_CPP}
			${FILES_UNIVERSAL_RESOURCES}
        )
    else()
		add_executable(${A_TARGET_NAME}
			${FILES_UNIVERSAL_HEADERS}
			${FILES_UNIVERSAL_CPP}
			${FILES_UNIVERSAL_RESOURCES}
        )
    endif()
endif()

if(IOS)
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

add_subdirectory("cpp/Asio")

target_include_directories(${A_TARGET_NAME} SYSTEM
#	PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/cpp/Asio"
	PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/cpp/Logger"
)

target_compile_definitions(${A_TARGET_NAME}
	PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)

target_link_libraries(${A_TARGET_NAME}
	PRIVATE
		Qt${QT_VERSION_MAJOR}::Core
		Qt${QT_VERSION_MAJOR}::Quick
		A_MODULE_Asio
)

