set(A_DIR_APPLICATION_ROOT ${CMAKE_CURRENT_LIST_DIR})

include_directories(SYSTEM ${A_DIR_APPLICATION_ROOT})

if(IOS)

	set(A_SOURCES_OBJECTIVE_HEADERS
		${A_SOURCES_OBJECTIVE_HEADERS}
		${A_DIR_APPLICATION_ROOT}/aapplicationdelegateiosnative.h
	)

	set(A_SOURCES_OBJECTIVE_CPP
		${A_SOURCES_OBJECTIVE_CPP}
		${A_DIR_APPLICATION_ROOT}/aapplicationdelegateiosnative.mm
	)

endif()

