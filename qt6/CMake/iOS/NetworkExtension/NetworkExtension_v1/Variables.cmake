# --------------------------
# Qt settings

set(A_QT_VERSION 6.5)
set(A_QT_COMPONENTS)


# --------------------------
# Paths

set(A_DIR_ROOT ${CMAKE_SOURCE_DIR})


# --------------------------
# Build settings

set(A_BUILD_SHOW_HEADERS true)
set(A_BUILD_SHOW_TIME_REPORT true)
set(A_BUILD_USING_PCH true)


# --------------------------
# Application variables

set(A_TARGET_LINK_LIBRARIES_PRIVATE)
set(A_TARGET_LINK_LIBRARIES_PUBLIC)
set(A_TARGET_INCLUDE_DIRECTORIES_PRIVATE)
set(A_TARGET_INCLUDE_DIRECTORIES_PUBLIC)

set(A_LANGUAGES)
set(A_SOURCES)
set(A_SOURCES_RESOURCES)
set(A_SOURCES_PRECOMPILED_HEADERS_PUBLIC)
set(A_SOURCES_PRECOMPILED_HEADERS_PRIVATE)
set(A_SOURCES_CPP)
set(A_SOURCES_CPP_HEADERS)

if(IOS)
	set(A_SOURCES_OBJC)
	set(A_SOURCES_OBJC_HEADERS)
	set(A_SOURCES_SWIFT)
endif()
