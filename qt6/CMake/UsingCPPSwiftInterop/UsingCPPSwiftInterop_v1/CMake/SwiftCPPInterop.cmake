function(ACheckSwiftRequirements)

	if("${CMAKE_Swift_COMPILER_VERSION}" VERSION_LESS 5.9)
		message(SEND_ERROR "Swift compiler: ${CMAKE_Swift_COMPILER_VERSION}")
		message(FATAL_ERROR "C++ Interop requires Swift 5.9 or greater")
	else()
		message(STATUS "Swift compiler: ${CMAKE_Swift_COMPILER_VERSION}")
	endif()

	if(
		NOT "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang" AND
		NOT "${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang"
	)
		message(SEND_ERROR "CXX compiler: ${CMAKE_CXX_COMPILER_ID}")
		message(FATAL_ERROR "SwiftCPP Interoperability require Clang")
	else()
		message(STATUS "CXX compiler: ${CMAKE_CXX_COMPILER_ID}")
	endif()

endfunction()


function(ASetupSwiftEnvironment)

	if(NOT SWIFT_LIBRARY_SEARCH_PATHS)

		if(APPLE)
			set(SDK_FLAGS "-sdk" "${CMAKE_OSX_SYSROOT}")
		endif()

		execute_process(
			COMMAND ${CMAKE_Swift_COMPILER} ${SDK_FLAGS} -print-target-info
			OUTPUT_VARIABLE SWIFT_TARGET_INFO
		)

		string(JSON SWIFT_TARGET_PATHS GET ${SWIFT_TARGET_INFO} "paths")

		string(JSON SWIFT_TARGET_LIBRARY_PATHS GET ${SWIFT_TARGET_PATHS} "runtimeLibraryPaths")
		string(JSON SWIFT_TARGET_LIBRARY_PATHS_LENGTH LENGTH ${SWIFT_TARGET_LIBRARY_PATHS})
		math(EXPR SWIFT_TARGET_LIBRARY_PATHS_LENGTH "${SWIFT_TARGET_LIBRARY_PATHS_LENGTH} - 1 ")

		string(JSON SWIFT_TARGET_LIBRARY_IMPORT_PATHS GET ${SWIFT_TARGET_PATHS} "runtimeLibraryImportPaths")
		string(JSON SWIFT_TARGET_LIBRARY_IMPORT_PATHS_LENGTH LENGTH ${SWIFT_TARGET_LIBRARY_IMPORT_PATHS})
		math(EXPR SWIFT_TARGET_LIBRARY_IMPORT_PATHS_LENGTH "${SWIFT_TARGET_LIBRARY_IMPORT_PATHS_LENGTH} - 1 ")

		string(JSON SWIFT_SDK_IMPORT_PATH ERROR_VARIABLE errno GET ${SWIFT_TARGET_PATHS} "sdkPath")

		foreach(JSON_ARG_IDX RANGE ${SWIFT_TARGET_LIBRARY_PATHS_LENGTH})
			string(JSON SWIFT_LIB GET ${SWIFT_TARGET_LIBRARY_PATHS} ${JSON_ARG_IDX})
			list(APPEND SWIFT_SEARCH_PATHS ${SWIFT_LIB})
		endforeach()

		foreach(JSON_ARG_IDX RANGE ${SWIFT_TARGET_LIBRARY_IMPORT_PATHS_LENGTH})
			string(JSON SWIFT_LIB GET ${SWIFT_TARGET_LIBRARY_IMPORT_PATHS} ${JSON_ARG_IDX})
			list(APPEND SWIFT_SEARCH_PATHS ${SWIFT_LIB})
		endforeach()

		if(SWIFT_SDK_IMPORT_PATH)
			list(APPEND SWIFT_SEARCH_PATHS ${SWIFT_SDK_IMPORT_PATH})
		endif()

		set(SWIFT_LIBRARY_SEARCH_PATHS ${SWIFT_SEARCH_PATHS} CACHE FILEPATH "Swift driver search paths")

	endif()

	link_directories(${SWIFT_LIBRARY_SEARCH_PATHS})

endfunction()


function(AGenerateSwiftHeaders inTarget inHeader)

	if(NOT TARGET ${inTarget})
		message(FATAL_ERROR "Target ${inTarget} not defined.")
	endif()

	if(NOT DEFINED CMAKE_Swift_COMPILER)
		message(SEND_ERROR "Cannot generate headers for Swift files")
		message(FATAL_ERROR "Swift not enabled in project")
		return()
	endif()

	cmake_parse_arguments(ARG "" "" "SEARCH_PATHS;MODULE_NAME" ${ARGN})

	if(NOT ARG_MODULE_NAME)
		set(oTargetModuleName $<TARGET_PROPERTY:${inTarget},Swift_MODULE_NAME>)
		set(ARG_MODULE_NAME $<IF:$<BOOL:${oTargetModuleName}>,${oTargetModuleName},${inTarget}>)
	endif()

	if(ARG_SEARCH_PATHS)
		list(TRANSFORM ARG_SEARCH_PATHS PREPEND "-I")
	endif()

	set(SDK_FLAGS "-sdk" "${CMAKE_OSX_SYSROOT}")

	cmake_path(APPEND CMAKE_CURRENT_BINARY_DIR include OUTPUT_VARIABLE oBasePath)
	cmake_path(APPEND oBasePath ${inHeader} OUTPUT_VARIABLE oHeaderPath)

	message(STATUS "oHeaderPath: ${oHeaderPath}")
	set(oAllSources $<TARGET_PROPERTY:${inTarget},SOURCES>)
	message(STATUS "oAllSources: ${oAllSources}")
	set(oSwiftSources $<FILTER:${oAllSources},INCLUDE,\\.swift$>)
	message(STATUS "oSwiftSources: ${oSwiftSources}")
	add_custom_command(OUTPUT ${oHeaderPath}
		DEPENDS ${oSwiftSources}
		WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
		COMMAND
			${CMAKE_Swift_COMPILER} -frontend -typecheck
			${ARG_SEARCH_PATHS}
			${oSwiftSources}
			${SDK_FLAGS}
			-module-name "${ARG_MODULE_NAME}"
			-cxx-interoperability-mode=default
			-emit-clang-header-path ${oHeaderPath}
		COMMENT "Generating '${oHeaderPath}'"
		COMMAND_EXPAND_LISTS
	)

	target_include_directories(${inTarget} PUBLIC ${oBasePath})
	target_sources(${inTarget} PRIVATE ${oHeaderPath})

endfunction()
