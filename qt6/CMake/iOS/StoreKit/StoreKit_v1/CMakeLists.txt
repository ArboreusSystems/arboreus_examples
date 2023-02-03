cmake_minimum_required(VERSION 3.16)


# ---------------------------------
# Project global variables

set(A_PROJECT_NAME StoreKit_v1)
set(A_PROJECT_DIR_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

set(A_CMAKE_GLOBAL_VARIABLES "${A_PROJECT_DIR_ROOT}/GlobalVariables.cmake")
if(EXISTS ${A_CMAKE_GLOBAL_VARIABLES})
	include(${A_CMAKE_GLOBAL_VARIABLES})
	message(STATUS "Included Global Variables settings cmake file: ${A_CMAKE_GLOBAL_VARIABLES}")
else()
	message(FATAL_ERROR "No Global Variables settings cmake file: ${A_CMAKE_GLOBAL_VARIABLES}")
endif()


# ---------------------------------
# Project settings

project(${A_PROJECT_NAME})

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(A_TARGET_LANGUAGES
	${A_TARGET_LANGUAGES}
	CXX
	C
)

if(IOS)

	set(A_SOURCES_SWIFT_OBJC_INTERFACE_HEADER_NAME "aswiftobjcinterface.h")
	set(A_SOURCES_SWIFT_OBJC_BRIDGING_HEADER "${A_PROJECT_DIR_ROOT}/aswiftobjcbridging.h")

	set(A_TARGET_LANGUAGES
		${A_TARGET_LANGUAGES}
		OBJCXX
		OBJC
		Swift
	)

endif()


# ---------------------------------
# Qt modules definitions

set(A_TARGET_QT_MODULES
	${A_TARGET_QT_MODULES}
	Core
	Quick
)

foreach(I_MODULE IN LISTS A_TARGET_QT_MODULES)
	set(A_TARGET_LINK_LIBRARIES_PRIVATE
		${A_TARGET_LINK_LIBRARIES_PRIVATE}
		Qt${QT_VERSION_MAJOR}::${I_MODULE}
	)
endforeach()

set(A_TARGET_COMPILE_DEFINITIONS_PRIVATE
	${A_TARGET_COMPILE_DEFINITIONS_PRIVATE}
	$<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)


# ---------------------------------
# Project modules definitions

set(A_CMAKE_MODULE_LOGGER "${A_PROJECT_DIR_ROOT}/cpp/Logger/ALogger.cmake")
if(EXISTS ${A_CMAKE_MODULE_LOGGER})
	include(${A_CMAKE_MODULE_LOGGER})
	message(STATUS "Included ALogger cmake file: ${A_CMAKE_MODULE_LOGGER}")
else()
	message(FATAL_ERROR "No ALogger cmake file: ${A_CMAKE_MODULE_LOGGER}")
endif()

set(A_CMAKE_MODULE_TEMPLATES "${A_PROJECT_DIR_ROOT}/cpp/Templates/Templates.cmake")
if(EXISTS ${A_CMAKE_MODULE_TEMPLATES})
	include(${A_CMAKE_MODULE_TEMPLATES})
	message(STATUS "Included ATemplates cmake file: ${A_CMAKE_MODULE_TEMPLATES}")
else()
	message(FATAL_ERROR "No ATemplates cmake file: ${A_CMAKE_MODULE_TEMPLATES}")
endif()

set(A_CMAKE_MODULE_CONFIG "${A_PROJECT_DIR_ROOT}/cpp/Config/Config.cmake")
if(EXISTS ${A_CMAKE_MODULE_CONFIG})
	include(${A_CMAKE_MODULE_CONFIG})
	message(STATUS "Included AConfig cmake file: ${A_CMAKE_MODULE_CONFIG}")
else()
	message(FATAL_ERROR "No AConfig cmake file: ${A_CMAKE_MODULE_CONFIG}")
endif()

set(A_CMAKE_MODULE_BACKEND "${A_PROJECT_DIR_ROOT}/cpp/Backend/Backend.cmake")
if(EXISTS ${A_CMAKE_MODULE_BACKEND})
	include(${A_CMAKE_MODULE_BACKEND})
	message(STATUS "Included ABackend cmake file: ${A_CMAKE_MODULE_BACKEND}")
else()
	message(FATAL_ERROR "No ABackend cmake file: ${A_CMAKE_MODULE_BACKEND}")
endif()

set(A_CMAKE_MODULE_STOREKIT "${A_PROJECT_DIR_ROOT}/cpp/StoreKit/StoreKit.cmake")
if(EXISTS ${A_CMAKE_MODULE_STOREKIT})
	include(${A_CMAKE_MODULE_STOREKIT})
	message(STATUS "Included AStoreKit cmake file: ${A_CMAKE_MODULE_STOREKIT}")
else()
	message(FATAL_ERROR "No AStoreKit cmake file: ${A_CMAKE_MODULE_STOREKIT}")
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


# ---------------------------------
# Project sources

set(A_SOURCES_RESOURCES
	${A_SOURCES_RESOURCES}
	${A_PROJECT_DIR_ROOT}/qml.qrc
)

set(A_SOURCES_PRECOMPILED_HEADERS_PRIVATE
	${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${A_PROJECT_DIR_ROOT}/amainpch.h
)

set(A_SOURCES_CPP
	${A_SOURCES_CPP}
	${A_PROJECT_DIR_ROOT}/main.cpp
)

set(A_SOURCES
	${A_SOURCES}
	${A_SOURCES_RESOURCES}
	${A_SOURCES_CPP_HEADERS}
	${A_SOURCES_CPP}
	${A_SOURCES_C_HEADERS}
	${A_SOURCES_C}
	${A_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
)

if(IOS)
	set(A_SOURCES
		${A_SOURCES}
		${A_SOURCES_SWIFT_OBJC_BRIDGING_HEADER}
		${A_SOURCES_OBJECTIVE_HEADERS}
		${A_SOURCES_OBJECTIVE_CPP}
		${A_SOURCES_SWIFT}
	)
endif()


# ---------------------------------
# Project target definitions

foreach(I_LANGUAGE IN LISTS A_TARGET_LANGUAGES)
	enable_language(${I_LANGUAGE})
endforeach()

find_package(QT NAMES Qt6 Qt5 COMPONENTS ${A_TARGET_QT_MODULES} REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS ${A_TARGET_QT_MODULES} REQUIRED)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
	qt_add_executable(${A_PROJECT_NAME}
		${A_SOURCES}
    )
else()
    if(ANDROID)
		add_library(${A_PROJECT_NAME} SHARED
			${A_SOURCES}
        )
    else()
		add_executable(${A_PROJECT_NAME}
		  ${A_SOURCES}
        )
    endif()
endif()

if(
	NOT "${A_SOURCES_PRECOMPILED_HEADERS_PUBLIC}" STREQUAL "" OR
	NOT "${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}" STREQUAL ""
)
	if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_OPTION_USING_PCH)
		message(STATUS "Using PCH for ${A_PROJECT_NAME}")
		target_precompile_headers(${A_PROJECT_NAME}
			PRIVATE ${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
			PUBLIC ${A_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
		)
		set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
	else()
		message(STATUS "No PCH for ${A_NAME_TARGET}")
	endif()
else()
	message(STATUS "PCH list empty.")
endif()

target_compile_definitions(${A_PROJECT_NAME}
	PUBLIC ${A_TARGET_COMPILE_DEFINITIONS_PUBLIC}
	PRIVATE ${A_TARGET_COMPILE_DEFINITIONS_PRIVATE}
)

target_include_directories(${A_PROJECT_NAME}
	PUBLIC ${A_TARGET_INCLUDE_DIRECTORIES_PUBLIC}
	PRIVATE ${A_TARGET_INCLUDE_DIRECTORIES_PRIVATE}
)

target_link_libraries(${A_PROJECT_NAME}
	PUBLIC ${A_TARGET_LINK_LIBRARIES_PUBLIC}
	PRIVATE ${A_TARGET_LINK_LIBRARIES_PRIVATE}
)

if(IOS)
	set_target_properties(${A_NAME_TARGET}
		PROPERTIES
			XCODE_ATTRIBUTE_SWIFT_OBJC_INTERFACE_HEADER_NAME "${A_SOURCES_SWIFT_OBJC_INTERFACE_HEADER_NAME}"
			XCODE_ATTRIBUTE_SWIFT_OBJC_BRIDGING_HEADER "${A_SOURCES_SWIFT_OBJC_BRIDGING_HEADER}"
			XCODE_ATTRIBUTE_ENABLE_BITCODE "NO"
			XCODE_ATTRIBUTE_ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES "YES"
			XCODE_ATTRIBUTE_SWIFT_VERSION "5.0"
	)
endif()
