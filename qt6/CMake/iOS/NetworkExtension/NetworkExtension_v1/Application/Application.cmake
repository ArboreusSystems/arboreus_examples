# --------------------------
# Definitions

set(A_APPLICATION_LANGUAGES	CXX)
set(A_APPLICATION_QT_COMPONENTS Quick)


# --------------------------
# Module: Main

set(A_DIR_APPLICATION_MODULE_MAIN "${A_DIR_APPLICATION}/Main")
set(A_CMAKE_APPLICATION_MODULE_MAIN "${A_DIR_APPLICATION_MODULE_MAIN}/Main.cmake")
if(EXISTS ${A_CMAKE_APPLICATION_MODULE_MAIN})
	message(STATUS "Included Application Main Module CMake file: ${A_CMAKE_APPLICATION_MODULE_MAIN}")
	include(${A_CMAKE_APPLICATION_MODULE_MAIN})
else()
	message(FATAL_ERROR "No Application Main Module CMake file: ${A_CMAKE_APPLICATION_MODULE_MAIN}")
endif()


# --------------------------
# Module: Logger

set(A_DIR_APPLICATION_MODULE_LOGGER "${A_DIR_APPLICATION}/Logger")
set(A_CMAKE_APPLICATION_MODULE_LOGGER "${A_DIR_APPLICATION_MODULE_LOGGER}/Logger.cmake")
if(EXISTS ${A_CMAKE_APPLICATION_MODULE_LOGGER})
	message(STATUS "Included Application Logger Module CMake file: ${A_CMAKE_APPLICATION_MODULE_LOGGER}")
	include(${A_CMAKE_APPLICATION_MODULE_LOGGER})
else()
	message(FATAL_ERROR "No Application Logger Module CMake file: ${A_CMAKE_APPLICATION_MODULE_LOGGER}")
endif()


# --------------------------
# Module: Backend

set(A_DIR_APPLICATION_MODULE_BACKEND "${A_DIR_APPLICATION}/Backend")
set(A_CMAKE_APPLICATION_MODULE_BACKEND "${A_DIR_APPLICATION_MODULE_BACKEND}/Backend.cmake")
if(EXISTS ${A_CMAKE_APPLICATION_MODULE_BACKEND})
	message(STATUS "Included Application Backend Module CMake file: ${A_CMAKE_APPLICATION_MODULE_BACKEND}")
	include(${A_CMAKE_APPLICATION_MODULE_BACKEND})
else()
	message(FATAL_ERROR "No Application Backend Module CMake file: ${A_CMAKE_APPLICATION_MODULE_BACKEND}")
endif()


# --------------------------
# Module: Extension Handler

set(A_DIR_APPLICATION_MODULE_EXTENSION_HANDLER "${A_DIR_APPLICATION}/ExtensionHandler")
set(A_CMAKE_APPLICATION_MODULE_EXTENSION_HANDLER "${A_DIR_APPLICATION_MODULE_EXTENSION_HANDLER}/ExtensionHandler.cmake")
if(EXISTS ${A_CMAKE_APPLICATION_MODULE_EXTENSION_HANDLER})
	message(STATUS "Included Application Extension Handler Module CMake file: ${A_CMAKE_APPLICATION_MODULE_EXTENSION_HANDLER}")
	include(${A_CMAKE_APPLICATION_MODULE_EXTENSION_HANDLER})
else()
	message(FATAL_ERROR "No Application Extension Handler Module CMake file: ${A_CMAKE_APPLICATION_MODULE_EXTENSION_HANDLER}")
endif()

