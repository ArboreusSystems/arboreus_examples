# ---------------------------------
# AStoreKit variables

set(A_STOREKIT_DIR_ROOT ${CMAKE_CURRENT_LIST_DIR})


# ---------------------------------
# Qt modules definitions

if(NOT "Core" IN_LIST A_TARGET_QT_MODULES)
	set(A_TARGET_QT_MODULES ${A_TARGET_QT_MODULES} Core)
endif()


# ---------------------------------
# AStoreKit sources

set(A_TARGET_INCLUDE_DIRECTORIES_PRIVATE
	${A_TARGET_INCLUDE_DIRECTORIES_PRIVATE}
	${A_STOREKIT_DIR_ROOT}
)

set(A_SOURCES_PRECOMPILED_HEADERS_PRIVATE
	${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${A_STOREKIT_DIR_ROOT}/astorekitpch.h
)

set(A_SOURCES_CPP_HEADERS
	${A_SOURCES_CPP_HEADERS}
	${A_STOREKIT_DIR_ROOT}/astorekit.h
	${A_STOREKIT_DIR_ROOT}/astorekitservice.h
	${A_STOREKIT_DIR_ROOT}/astorekitconfiginterface.h
	${A_STOREKIT_DIR_ROOT}/astorekitnativehandlerinterface.h
	${A_STOREKIT_DIR_ROOT}/astorekitdatamodels.h
)

set(A_SOURCES_CPP
	${A_SOURCES_CPP}
	${A_STOREKIT_DIR_ROOT}/astorekit.cpp
	${A_STOREKIT_DIR_ROOT}/astorekitservice.cpp
)


# ---------------------------------
# IOS part

if(IOS)

	set(A_TARGET_INCLUDE_DIRECTORIES_PRIVATE
		${A_TARGET_INCLUDE_DIRECTORIES_PRIVATE}
		${A_STOREKIT_DIR_ROOT}/IOS
	)

	set(A_SOURCES_CPP_HEADERS
		${A_SOURCES_CPP_HEADERS}
		${A_STOREKIT_DIR_ROOT}/IOS/astorekitiosnativehandler.h
	)

	set(A_SOURCES_CPP
		${A_SOURCES_CPP}
		${A_STOREKIT_DIR_ROOT}/IOS/astorekitiosnativehandler.cpp
	)

	set(A_SOURCES_OBJECTIVE_HEADERS
		${A_SOURCES_OBJECTIVE_HEADERS}
		${A_STOREKIT_DIR_ROOT}/IOS/astorekitnativeobjc.h
		${A_STOREKIT_DIR_ROOT}/IOS/astorekitnativeobjcglobal.h
	)

	set(A_SOURCES_OBJECTIVE_CPP
		${A_SOURCES_OBJECTIVE_CPP}
		${A_STOREKIT_DIR_ROOT}/IOS/astorekitnativeobjc.mm
	)

	set(A_SOURCES_SWIFT
		${A_SOURCES_SWIFT}
		${A_STOREKIT_DIR_ROOT}/IOS/astorekitnative.swift
	)

	if(${CMAKE_OSX_SYSROOT} MATCHES "iphonesimulator")
		if (${CMAKE_OSX_ARCHITECTURES} MATCHES "arm64")
			message(STATUS "iOS Build for simulator arm64")
		elseif(${CMAKE_OSX_ARCHITECTURES} MATCHES "x86_64")
			message(STATUS "iOS Build for simulator x86_64")
		endif()
	elseif(${CMAKE_OSX_SYSROOT} MATCHES "iphoneos")
		message(STATUS "iOS Build for iphone")
	else()
		message(FATAL_ERROR "iOS undefined build")
	endif()


# ---------------------------------
# Android part

elseif(ANDROID)

	set(A_TARGET_INCLUDE_DIRECTORIES_PRIVATE
		${A_TARGET_INCLUDE_DIRECTORIES_PRIVATE}
		${A_STOREKIT_DIR_ROOT}/Android
	)

	set(A_SOURCES_CPP_HEADERS
		${A_SOURCES_CPP_HEADERS}
		${A_STOREKIT_DIR_ROOT}/Android/astorekitiosnativehandler.h
	)

	set(A_SOURCES_CPP
		${A_SOURCES_CPP}
		${A_STOREKIT_DIR_ROOT}/Android/astorekitiosnativehandler.cpp
	)

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


# ---------------------------------
# MacOS part

elseif(APPLE)

	set(A_TARGET_INCLUDE_DIRECTORIES_PRIVATE
		${A_TARGET_INCLUDE_DIRECTORIES_PRIVATE}
		${A_STOREKIT_DIR_ROOT}/MacOS
	)

	set(A_SOURCES_CPP_HEADERS
		${A_SOURCES_CPP_HEADERS}
		${A_STOREKIT_DIR_ROOT}/MacOS/astorekitmacosnativehandler.h
	)

	set(A_SOURCES_CPP
		${A_SOURCES_CPP}
		${A_STOREKIT_DIR_ROOT}/MacOS/astorekitmacosnativehandler.cpp
	)

	if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")
		message(STATUS "MacOS Build for x86_64")
	elseif(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "arm64")
		message(STATUS "MacOS Build for arm64")
	else()
		message(FATAL_ERROR "MacOS undefined build")
	endif()


# ---------------------------------
# Undefined platform part

else()
	message(FATAL_ERROR "Undefined build")
endif()
