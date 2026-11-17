cmake_minimum_required(VERSION 3.16)


## ----------------------------------------
## Global variables

set(A_NAME RevenueCat_v1)
set(A_NAME_TARGET target_${A_NAME})
set(A_NAME_APPLICATION ${A_NAME})
set(A_PREFIX A_${A_NAME_TARGET})

set(${A_PREFIX}_DIR_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(${A_PREFIX}_VERSION 1.0.0)
set(${A_PREFIX}_VERSION_SHORT 1.0.0)
set(${A_PREFIX}_VERSION_CODE 5)

set(${A_PREFIX}_BUILD_TYPE ${CMAKE_BUILD_TYPE})
if(NOT ${A_PREFIX}_BUILD_TYPE STREQUAL "")
	message(STATUS "Defined build type: " ${${A_PREFIX}_BUILD_TYPE})
else()
	message(FATAL_ERROR "Can't define build type")
endif()


## ----------------------------------------
## Project settings

project(${A_NAME_TARGET} VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)


set(${A_PREFIX}_GLOBAL_CONF "${${A_PREFIX}_DIR_ROOT}/../../RevenueCat.conf.cmake")
if(EXISTS ${${A_PREFIX}_GLOBAL_CONF})
	include(${${A_PREFIX}_GLOBAL_CONF})
	message(STATUS "Added global configuration file: " ${${A_PREFIX}_GLOBAL_CONF})
else()
	message(FATAL_ERROR "No global configuration file: " ${${A_PREFIX}_GLOBAL_CONF})
endif()


## ----------------------------------------
## Project variables

set(${A_PREFIX}_DIR_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(${A_PREFIX}_DIR_PLATFORMS ${${A_PREFIX}_DIR_ROOT}/Platforms)

set(${A_PREFIX}_SOURCES)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC)
set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE)
set(${A_PREFIX}_SOURCES_HEADERS)
set(${A_PREFIX}_SOURCES_CPP)
set(${A_PREFIX}_SOURCES_RESOURCES)

set(${A_PREFIX}_PROPERTIES)

set(${A_PREFIX}_INCLUDE_DIR_PUBLIC)
set(${A_PREFIX}_INCLUDE_DIR_PRIVATE)


## ----------------------------------------
## Project sources

set(${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	main_pch.h
)

set(${A_PREFIX}_SOURCES_HEADERS
	${${A_PREFIX}_SOURCES_HEADERS}
	RevenueCat/arevenuecat.h
	RevenueCat/arevenuecatdatamodels.h
	RevenueCat/Driver/arevenuecatdriver.h
)

set(${A_PREFIX}_SOURCES_CPP
	${${A_PREFIX}_SOURCES_CPP}
	main.cpp
	RevenueCat/arevenuecat.cpp
	RevenueCat/Driver/arevenuecatdriver.cpp

)

set(${A_PREFIX}_SOURCES_RESOURCES
	${${A_PREFIX}_SOURCES_RESOURCES}
	main.qrc
)

set(${A_PREFIX}_SOURCES
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${${A_PREFIX}_SOURCES_HEADERS}
	${${A_PREFIX}_SOURCES_CPP}
	${${A_PREFIX}_SOURCES_RESOURCES}
)

set(${A_PREFIX}_INCLUDE_DIR_PUBLIC
	${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
	${${A_PREFIX}_DIR_ROOT}
	${${A_PREFIX}_DIR_ROOT}/RevenueCat
	${${A_PREFIX}_DIR_ROOT}/RevenueCat/Driver
)

if(APPLE)

	set(${A_PREFIX}_PROPERTIES
		${${A_PREFIX}_PROPERTIES}
		MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
		MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
		MACOSX_BUNDLE TRUE
	)

endif()

if(IOS)

	set(${A_PREFIX}_PATH_REVENUECAT_FRAMEWORK "${A_CONF_IOS_PATH_REVENUECAT_FRAMEWORK}")

	set(${A_PREFIX}_PATH_STOREKIT_CONFIGURATION "${A_CONF_IOS_PATH_STOREKIT_CONFIGURATION}")
	if(EXISTS "${${A_PREFIX}_PATH_STOREKIT_CONFIGURATION}")
		message(STATUS "Added StoreKit configuration file: ${${A_PREFIX}_PATH_STOREKIT_CONFIGURATION}")
	else()
		message(FATAL_ERROR "StoreKit configuration file NOT found: ${${A_PREFIX}_PATH_STOREKIT_CONFIGURATION}")
	endif()

	# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
	# If you are developing for iOS or macOS you should consider setting an
	# explicit, fixed bundle identifier manually though.

	set(${A_PREFIX}_PROPERTIES
		${${A_PREFIX}_PROPERTIES}
		# MACOSX_BUNDLE_INFO_PLIST "${${A_PREFIX}_IOS_INFO_PLIST}"
		MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
		MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
		MACOSX_BUNDLE TRUE
		MACOSX_BUNDLE_GUI_IDENTIFIER "${A_CONF_IOS_BUNDLE_GUI_IDENTIFIER}"
	)

	set(${A_PREFIX}_SOURCES_OBJ_CPP_HEADERS
		${${A_PREFIX}_SOURCES_OBJ_CPP_HEADERS}
		RevenueCat/Driver/arevenuecatdriverios.h
		RevenueCat/Driver/arevenuecatdriveriosnative.h
	)

	set(${A_PREFIX}_SOURCES_OBJ_CPP
		${${A_PREFIX}_SOURCES_OBJ_CPP}
		RevenueCat/Driver/arevenuecatdriverios.mm
	)

	set(${A_PREFIX}_SOURCES
		${${A_PREFIX}_SOURCES}
		${${A_PREFIX}_SOURCES_OBJ_CPP_HEADERS}
		${${A_PREFIX}_SOURCES_OBJ_CPP}
		${${A_PREFIX}_PATH_STOREKIT_CONFIGURATION}
	)

endif()

if(ANDROID)

	set(QT_FORCE_CMP0156_TO_VALUE NEW)

	set(${A_PREFIX}_ANDROID_DIR ${${A_PREFIX}_DIR_PLATFORMS}/Android)
	set(${A_PREFIX}_ANDROID_DIR_SOURCES ${${A_PREFIX}_ANDROID_DIR}/src)
	set(${A_PREFIX}_ANDROID_PACKAGE_NAME ${A_CONF_ANDROID_PACKAGE_NAME})

	if(NOT ${A_PREFIX}_BUILD_TYPE STREQUAL "Debug")
		set(QT_ANDROID_ABIS "arm64-v8a;armeabi-v7a" CACHE STRING "Target Android ABIs" FORCE)
	endif()
	message(STATUS "Defined Android package name: ${${A_PREFIX}_ANDROID_PACKAGE_NAME}")

	set(${A_PREFIX}_SOURCES_ANDROID_HEADERS
		${${A_PREFIX}_SOURCES_ANDROID_HEADERS}
		RevenueCat/Driver/arevenuecatdriverandroid.h
	)

	set(${A_PREFIX}_SOURCES_ANDROID_CPP
		${${A_PREFIX}_SOURCES_ANDROID_CPP}
		RevenueCat/Driver/arevenuecatdriverandroid.cpp
	)

	set(${A_PREFIX}_SOURCES_ANDROID_JAVA
		${${A_PREFIX}_ANDROID_DIR_SOURCES}/systems/arboreus/ARevenueNative/ARevenueBridge.java
	)

	set(${A_PREFIX}_SOURCES
		${${A_PREFIX}_SOURCES}
		${${A_PREFIX}_SOURCES_ANDROID_HEADERS}
		${${A_PREFIX}_SOURCES_ANDROID_CPP}
		${${A_PREFIX}_SOURCES_ANDROID_JAVA}
	)

	set(${A_PREFIX}_PROPERTIES
		${${A_PREFIX}_PROPERTIES}
		QT_ANDROID_PACKAGE_NAME "${${A_PREFIX}_ANDROID_PACKAGE_NAME}"
		QT_ANDROID_VERSION_CODE ${${A_PREFIX}_VERSION_CODE}
		QT_ANDROID_VERSION_NAME "${${A_PREFIX}_VERSION}"
		QT_ANDROID_PACKAGE_SOURCE_DIR ${${A_PREFIX}_ANDROID_DIR}
		QT_ANDROID_MIN_SDK_VERSION "30"
		QT_ANDROID_API_VERSION "37"
		QT_ANDROID_TARGET_SDK_VERSION "37"
	)

endif()


## ----------------------------------------
## Qt Application settings

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2)
qt_standard_project_setup(REQUIRES 6.8)
qt_add_executable(${A_NAME_APPLICATION} ${${A_PREFIX}_SOURCES})


## ----------------------------------------
## Application properties

list(LENGTH ${A_PREFIX}_PROPERTIES ${A_PREFIX}_PROPERTIES_LENGTH)
if(NOT ${A_PREFIX}_PROPERTIES_LENGTH EQUAL 0)
	set_target_properties(${A_NAME_APPLICATION}
		PROPERTIES
			${${A_PREFIX}_PROPERTIES}
	)
endif()


## ----------------------------------------
## Include directories settings

target_include_directories(${A_NAME_APPLICATION}
	PUBLIC ${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
	PRIVATE ${${A_PREFIX}_INCLUDE_DIR_PUBLIC}
)


## ----------------------------------------
## Libraries settings

target_link_libraries(${A_NAME_APPLICATION}
	PRIVATE
		Qt6::Quick
		Qt6::QuickControls2
		ALogger
)

## ----------------------------------------
## RevenueCat settings

set(${A_PREFIX}_SOURCES_GLOBAL_CONFIG_HEADER ${${A_PREFIX}_DIR_ROOT}/revenue.conf.h)

if(IOS)

	write_file(${${A_PREFIX}_SOURCES_GLOBAL_CONFIG_HEADER}
		"#ifndef REVENUECAT_CONF_H\n"
		"#define REVENUECAT_CONF_H\n"
		"#define _A_ID_APLICATION_REVENUECAT \"${A_CONF_IOS_ID_APLICATION_REVENUECAT}\"\n"
		"#endif\n"
	)

	if(CMAKE_OSX_SYSROOT MATCHES "iphonesimulator")
		set(${A_PREFIX}_DIR_CURRENT_REVENUECAT "${A_CONF_PATH_REVENUECAT_FRAMEWORK}/Simulator")
		set(${A_PREFIX}_PATH_CHOSEN_REVENUECAT "${A_CONF_PATH_REVENUECAT_FRAMEWORK}/Simulator/RevenueCat.framework")
	else()
		set(${A_PREFIX}_DIR_CURRENT_REVENUECAT "${A_CONF_PATH_REVENUECAT_FRAMEWORK}/Device")
		set(${A_PREFIX}_PATH_CHOSEN_REVENUECAT "${A_CONF_PATH_REVENUECAT_FRAMEWORK}/Device/RevenueCat.framework")
	endif()
	if(NOT EXISTS "${${A_PREFIX}_PATH_CHOSEN_REVENUECAT}")
		message(FATAL_ERROR "No RevenueCat framework: ${${A_PREFIX}_PATH_CHOSEN_REVENUECAT}")
	endif()

	target_compile_options(${A_NAME_APPLICATION}
		PRIVATE
			"-F${${A_PREFIX}_DIR_CURRENT_REVENUECAT}"
			"-fmodules"
			"-fcxx-modules"
	)

	target_link_options(${A_NAME_APPLICATION}
		PRIVATE
			"-F${${A_PREFIX}_DIR_CURRENT_REVENUECAT}"
			"-Wl,-rpath,@executable_path/Frameworks"
	)

	target_sources(${A_NAME_APPLICATION}
		PRIVATE
			"${${A_PREFIX}_PATH_STOREKIT_CONFIGURATION}"
	)

	set_source_files_properties(${${A_PREFIX}_PATH_STOREKIT_CONFIGURATION}
		PROPERTIES
			MACOSX_PACKAGE_LOCATION Resources
	)

	set_target_properties(${A_NAME_APPLICATION}
		PROPERTIES
			# XCODE_GENERATE_SCHEME FALSE
			XCODE_SCHEME_STOREKIT_CONFIGURATION "${${A_PREFIX}_PATH_STOREKIT_CONFIGURATION}"
			XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "${${A_PREFIX}_DIR_CURRENT_REVENUECAT}"
			XCODE_ATTRIBUTE_CLANG_ENABLE_MODULES "YES"
			XCODE_EMBED_FRAMEWORKS "${${A_PREFIX}_PATH_CHOSEN_REVENUECAT}"
			XCODE_EMBED_FRAMEWORKS_CODE_SIGN_ON_COPY ON
			XCODE_ATTRIBUTE_SIGNING_ALLOWED TRUE
	)

	target_link_libraries(${A_NAME_APPLICATION} PRIVATE
		"${${A_PREFIX}_PATH_CHOSEN_REVENUECAT}"
		"-framework StoreKit"
		"-framework SystemConfiguration"
		"-framework Security"
		"-framework Foundation"
		"-framework UIKit"
		"-framework CFNetwork"
	)

	message(STATUS "Configured RevenueCat.framework")

endif()

if(ANDROID)

	write_file(${${A_PREFIX}_SOURCES_GLOBAL_CONFIG_HEADER}
		"#ifndef REVENUECAT_CONF_H\n"
		"#define REVENUECAT_CONF_H\n"
		"#define _A_ID_APLICATION_REVENUECAT \"${A_CONF_ANDROID_ID_APPLICATION_REVENUECAT}\"\n"
		"#endif\n"
	)

endif()


## ----------------------------------------
## Precompiled headers settings

if(
	NOT ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE} EQUAL "" OR
	NOT ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC} EQUAL ""
)
    if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_OPTION_USING_PCH)
        message(STATUS "Using PCH for ${A_NAME_APPLICATION}")
        target_precompile_headers(${A_NAME_APPLICATION}
			PRIVATE ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
			PUBLIC ${${A_PREFIX}_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
        )
        set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
    else()
        message(STATUS "No PCH for ${A_NAME_APPLICATION}")
    endif()
endif()
