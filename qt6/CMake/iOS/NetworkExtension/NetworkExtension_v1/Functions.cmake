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
