# --------------------------
# Network Extension

set(A_EXTENSION_NAME Extension_v1)
set(A_EXTENSION_VERSION ${A_PROJECT_VERSION})

add_executable(${A_EXTENSION_NAME})
set_target_properties(${A_EXTENSION_NAME} PROPERTIES

)

add_dependencies(${A_PROJECT_NAME} ${A_EXTENSION_NAME})
set_target_properties(apptestQt65
	PROPERTIES
		XCODE_EMBED_APP_EXTENSIONS ${A_EXTENSION_NAME}
)

