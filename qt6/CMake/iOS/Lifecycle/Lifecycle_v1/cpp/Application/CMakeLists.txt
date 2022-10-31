cmake_minimum_required(VERSION 3.14)

set(A_DIR_MODULE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
set(A_NAME_TARGET AApplication)

option(A_OPTION_USING_PCH "${A_NAME_TARGET} using PCH support" ON)
enable_language(OBJC OBJCXX)

set(A_INCLUDE_DIRECTORIES_PUBLIC
	${A_DIR_MODULE_ROOT}
)

set(A_INCLUDE_DIRECTORIES_PRIVATE

)

set(SOURCES_RESOURCES

)

set(SOURCES_HEADERS
	${A_DIR_MODULE_ROOT}/aapplication.h
	${A_DIR_MODULE_ROOT}/aappllicationservice.h
	${A_DIR_MODULE_ROOT}/aapplicationconfig.h
)

set(SOURCES_CPP
	${A_DIR_MODULE_ROOT}/aapplication.cpp
	${A_DIR_MODULE_ROOT}/aappllicationservice.cpp
)

set(SOURCES_PRECOMPILED_HEADERS_PUBLIC

)

set(SOURCES_PRECOMPILED_HEADERS_PRIVATE
	${A_DIR_MODULE_ROOT}/aapplicationpch.h
)

set(SOURCES
	${SOURCES_RESOURCES}
	${SOURCES_CPP}
	${SOURCES_HEADERS}
	${SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${SOURCES_PRECOMPILED_HEADERS_PRIVATE}
)

if(IOS)

#	set(SOURCES_OBJECTIVE_HEADERS
#		${A_DIR_MODULE_ROOT}/aapplicationdelegateiosnative.h
#	)

#	set(SOURCES_OBJECTIVE_CPP
#		${A_DIR_MODULE_ROOT}/aapplicationdelegateiosnative.mm
#	)

#	list(APPEND SOURCES
#		${SOURCES_OBJECTIVE_HEADERS}
#		${SOURCES_OBJECTIVE_CPP}
#	)

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
	if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")
		message(STATUS "MacOS Build for x86_64")
	elseif(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "arm64")
		message(STATUS "MacOS Build for arm64")
	else()
		message(FATAL_ERROR "MacOS undefined build")
	endif()
else()
	message(FATAL_ERROR "-- Undefined build")
endif()

add_library(${A_NAME_TARGET} STATIC ${SOURCES})

if(
	NOT ${SOURCES_PRECOMPILED_HEADERS_PUBLIC} EQUAL "" OR
	NOT ${SOURCES_PRECOMPILED_HEADERS_PRIVATE} EQUAL ""
)
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
endif()

target_include_directories(${A_NAME_TARGET}
	PUBLIC ${A_INCLUDE_DIRECTORIES_PUBLIC}
	PRIVATE ${A_INCLUDE_DIRECTORIES_PRIVATE}
)

target_link_libraries(${A_NAME_TARGET}
	PRIVATE
		Qt${QT_VERSION_MAJOR}::Core
		Qt${QT_VERSION_MAJOR}::Quick
	PUBLIC
		ALogger
		ABackend
		ATemplates
		AConfig
)
