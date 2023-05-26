# --------------------------
# Initiate project

cmake_minimum_required(VERSION 3.24)

set(A_PROJECT_NAME Application_v1)
set(A_PROJECT_VERSION 0.1)

project(${A_PROJECT_NAME} VERSION ${A_PROJECT_VERSION})


# --------------------------
# Include project variables

set(A_CMAKE_VARIABLES "${CMAKE_CURRENT_LIST_DIR}/Variables.cmake")
if(EXISTS ${A_CMAKE_VARIABLES})
	message(STATUS "Included Variables CMake file: ${A_CMAKE_VARIABLES}")
	include(${A_CMAKE_VARIABLES})
else()
	message(FATAL_ERROR "No project Variables CMake file: ${A_CMAKE_VARIABLES}")
endif()


# --------------------------
# Include global project settings

set(A_CMAKE_GLOBAL "${CMAKE_CURRENT_LIST_DIR}/Global.cmake")
if(EXISTS ${A_CMAKE_GLOBAL})
	message(STATUS "Included Global CMake file: ${A_CMAKE_GLOBAL}")
	include(${A_CMAKE_GLOBAL})
else()
	message(FATAL_ERROR "No project Global CMake file: ${A_CMAKE_GLOBAL}")
endif()


# --------------------------
# Include global project settings

set(A_CMAKE_FUNCTIONS "${CMAKE_CURRENT_LIST_DIR}/Functions.cmake")
if(EXISTS ${A_CMAKE_FUNCTIONS})
	message(STATUS "Included Functions CMake file: ${A_CMAKE_FUNCTIONS}")
	include(${A_CMAKE_FUNCTIONS})
else()
	message(FATAL_ERROR "No project Functions CMake file: ${A_CMAKE_FUNCTIONS}")
endif()


# --------------------------
# Application definitions

set(A_DIR_APPLICATION "${A_DIR_ROOT}/Application")
set(A_CMAKE_APPLICATION "${A_DIR_APPLICATION}/Application.cmake")
if(EXISTS ${A_CMAKE_APPLICATION})
	message(STATUS "Included Application CMake file: ${A_CMAKE_APPLICATION}")
	include(${A_CMAKE_APPLICATION})
else()
	message(FATAL_ERROR "No Application CMake file: ${A_CMAKE_APPLICATION}")
endif()


# --------------------------
# Sources

set(A_SOURCES
	${A_SOURCES}
	${A_SOURCES_RESOURCES}
	${A_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
	${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${A_SOURCES_CPP}
	${A_SOURCES_CPP_HEADERS}
	${A_SOURCES_OTHER}
)

if(IOS OR APPLE)

	set(A_SOURCES
		${A_SOURCES}
		${A_SOURCES_OBJC}
		${A_SOURCES_OBJC_HEADERS}
		${A_SOURCES_SWIFT}
		${A_ENTITLEMENT}
	)

	if(NOT "${A_INFO_PLIST}" STREQUAL "")
		set(A_SOURCES ${A_SOURCES} ${A_INFO_PLIST})
	endif()

endif()


# --------------------------
# Application

enable_language(${A_LANGUAGES})
find_package(Qt6 ${A_QT_VERSION} REQUIRED COMPONENTS ${A_QT_COMPONENTS})
qt_standard_project_setup(REQUIRES ${A_QT_VERSION})
qt_add_executable(${A_PROJECT_NAME} ${A_SOURCES})


# --------------------------
# Extension definitions

if(APPLE OR IOS)

	set(A_DIR_EXTENSION "${A_DIR_ROOT}/Extension")
	set(A_CMAKE_EXTENSION "${A_DIR_EXTENSION}/Extension.cmake")
	if(EXISTS ${A_CMAKE_EXTENSION})
		message(STATUS "Included Extension CMake file: ${A_CMAKE_EXTENSION}")
		include(${A_CMAKE_EXTENSION})
	else()
		message(FATAL_ERROR "No Extension CMake file: ${A_CMAKE_EXTENSION}")
	endif()

	add_dependencies(${A_PROJECT_NAME} ${A_EXTENSION_NAME})

	set_target_properties(${A_PROJECT_NAME} PROPERTIES
		XCODE_EMBED_APP_EXTENSIONS ${A_EXTENSION_NAME}
	)

	A_AddEntitlement(${A_PROJECT_NAME} "${A_ENTITLEMENT}")
	A_AddInfoPlist(${A_PROJECT_NAME} "${A_INFO_PLIST}")

endif()

#qt_add_qml_module(${A_PROJECT_NAME}
#    URI NetworkExtension_v1
#    VERSION 1.0
#    QML_FILES Main.qml
#)

#set_target_properties(${A_PROJECT_NAME} PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
#    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
#    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
#    MACOSX_BUNDLE TRUE
#    WIN32_EXECUTABLE TRUE
#)

# --------------------------
# Define precompiled headers

if(
	NOT "${A_SOURCES_PRECOMPILED_HEADERS_PUBLIC}" STREQUAL "" OR
	NOT "${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}" STREQUAL ""
)
	if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.16 AND A_BUILD_USING_PCH)
		message(STATUS "Using PCH for ${A_PROJECT_NAME}")
		target_precompile_headers(${A_PROJECT_NAME}
			PRIVATE ${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
			PUBLIC ${A_SOURCES_PRECOMPILED_HEADERS_PUBLIC}
		)
		set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
	else()
		message(STATUS "No PCH for ${A_PROJECT_NAME}")
	endif()
else()
	message(STATUS "No PCH sources in ${A_PROJECT_NAME}")
endif()


# --------------------------
# Link libraries

foreach(I_COMPONENT IN LISTS A_QT_COMPONENTS)
	message(STATUS "Appending Qt Component: ${I_COMPONENT}")
	list(APPEND A_TARGET_LINK_LIBRARIES_PRIVATE
		Qt6::${I_COMPONENT}
	)
endforeach()
target_link_libraries(${A_PROJECT_NAME}
	PRIVATE ${A_TARGET_LINK_LIBRARIES_PRIVATE}
	PUBLIC ${A_TARGET_LINK_LIBRARIES_PUBLIC}
)


# --------------------------
# Include directories

target_include_directories(${A_PROJECT_NAME}
	PRIVATE ${A_TARGET_INCLUDE_DIRECTORIES_PRIVATE}
	PUBLIC ${A_TARGET_INCLUDE_DIRECTORIES_PUBLIC}
)


# --------------------------
# Install definitions

#install(TARGETS ${A_PROJECT_NAME}
#    BUNDLE DESTINATION .
#    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
#)
