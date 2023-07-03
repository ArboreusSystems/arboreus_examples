# --------------------------
# Add languages to project

function(A_SetLanguages)

	foreach(I_LANGUAGE IN LISTS ARGV)
		if(NOT I_LANGUAGE IN_LIST A_LANGUAGES)
			message(STATUS "Adding language to list: ${I_LANGUAGE}")
			list(APPEND A_LANGUAGES ${I_LANGUAGE})
		else()
			message(STATUS "Language already in list: ${I_LANGUAGE}")
		endif()
	endforeach()

	set(A_LANGUAGES ${A_LANGUAGES} PARENT_SCOPE)

endfunction()


# --------------------------
# Add Qt components

function(A_SetQtComponents)

	foreach(I_COMPONENT IN LISTS ARGV)
		if(NOT I_COMPONENT IN_LIST A_QT_COMPONENTS)
			message(STATUS "Adding Qt Component to list: ${I_COMPONENT}")
			list(APPEND A_QT_COMPONENTS ${I_COMPONENT})
		else()
			message(STATUS "Qt Component already in list: ${I_COMPONENT}")
		endif()
	endforeach()

	set(A_QT_COMPONENTS ${A_QT_COMPONENTS} PARENT_SCOPE)

endfunction()


# --------------------------
# Add entitlement to application

function(A_AddEntitlement IN_TARGET IN_ENTITLEMENT)

	if(NOT "${IN_ENTITLEMENT}" STREQUAL "")
		if(EXISTS ${IN_ENTITLEMENT})
			message(STATUS "For ${IN_TARGET} Entitlements defined in: ${IN_ENTITLEMENT}")
			set_target_properties(${IN_TARGET} PROPERTIES
				XCODE_ATTRIBUTE_CODE_SIGN_ENTITLEMENTS ${IN_ENTITLEMENT}
			)
		else()
			message(FATAL_ERROR "For ${IN_TARGET} Entitlement file not existed: ${IN_ENTITLEMENT}")
		endif()
	else()
		message(STATUS "No defined entitlement file for ${IN_TARGET}")
	endif()

endfunction()


# --------------------------
# Add Info.plist

function(A_AddInfoPlist IN_TARGET IN_INFO_PLIST)

	if(NOT "${IN_INFO_PLIST}" STREQUAL "")
		if(EXISTS ${IN_INFO_PLIST})
			message(STATUS "For ${IN_TARGET} defined Info.plist file: ${IN_INFO_PLIST}")
			set_target_properties(${IN_TARGET} PROPERTIES
				MACOSX_BUNDLE_INFO_PLIST ${IN_INFO_PLIST}
			)
		else()
			message(FATAL_ERROR "For ${IN_TARGET} Info.plist file not existed: ${IN_INFO_PLIST}")
		endif()
	else()
		message(STATUS "No defined Info.plist file for ${IN_TARGET}")
	endif()

endfunction()


# --------------------------
# Add bundle identifier

function(A_AddBundleIdentifier IN_TARGET IN_BUNDLE_IDENTIFIER)

	if(NOT "${IN_BUNDLE_IDENTIFIER}" STREQUAL "")
		message(STATUS "For ${IN_TARGET} defined Bundle Identifier: ${IN_BUNDLE_IDENTIFIER}")
		set_target_properties(${IN_TARGET} PROPERTIES
			XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER ${IN_BUNDLE_IDENTIFIER}
		)
	else()
		message(FATAL_ERROR "Empty BUNDLE_IDENTIFIER")
	endif()

endfunction()


# --------------------------
# Add team

function(A_AddTeam IN_TARGET IN_TEAM)

	if("${IN_TARGET}" STREQUAL "")
		message(FATAL_ERROR "No defined target")
	else()

		if("${IN_BUNDLE_IDENTIFIER}" STREQUAL "")
			message(STATUS "For ${IN_TARGET} defined Team Identifier: ${IN_TEAM}")
			set_target_properties(${IN_TARGET} PROPERTIES
				XCODE_ATTRIBUTE_DEVELOPMENT_TEAM ${IN_TEAM}
			)
		else()
			if(NOT A_BUILD_EMPTY_TEAM_ID)
				message(FATAL_ERROR "Empty TEAM_ID")
			endif()
		endif()

	endif()

endfunction()


function(A_AddProvisioningProfile IN_TARGET IN_BUNDLE_ID)

	if("${IN_TARGET}" STREQUAL "")
		message(FATAL_ERROR "No defined target")
	else()

	endif()

endfunction()

function(A_AddFramework IN_TARGET IN_FRAMEWORK)

	find_library(FRAMEWORK_${IN_FRAMEWORK}
		NAMES ${IN_FRAMEWORK}
		PATHS ${CMAKE_OSX_SYSROOT}/System/Library
		PATH_SUFFIXES Frameworks
		NO_DEFAULT_PATH
	)

	if( ${FRAMEWORK_${IN_FRAMEWORK}} STREQUAL FRAMEWORK_${IN_FRAMEWORK}-NOTFOUND)
		message(FATAL_ERROR "Framework ${IN_FRAMEWORK} not found")
	else()
		target_link_libraries(${IN_TARGET} PUBLIC ${FRAMEWORK_${IN_FRAMEWORK}})
		message(STATUS "Framework ${IN_FRAMEWORK} found at ${FRAMEWORK_${IN_FRAMEWORK}}")
	endif()

endfunction()
