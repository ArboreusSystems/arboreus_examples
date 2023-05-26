# --------------------------
# Module properties

set(A_MODULE_LANGUAGES CXX C OBJC Swift)
set(A_MODULE_QT_COMPONENTS Core)

set(A_TARGET_INCLUDE_DIRECTORIES_PRIVATE
	${A_TARGET_INCLUDE_DIRECTORIES_PRIVATE}
	${A_DIR_APPLICATION_MODULE_MAIN}
)


# --------------------------
# Module sources

set(A_SOURCES_RESOURCES
	${A_SOURCES_RESOURCES}

)

set(A_SOURCES_CPP
	${A_SOURCES_CPP}

)

set(A_SOURCES_PRECOMPILED_HEADERS_PUBLIC
	${A_SOURCES_PRECOMPILED_HEADERS_PUBLIC}

)


# --------------------------
# Define Project

A_SetLanguages(${A_MODULE_LANGUAGES})
A_SetQtComponents(${A_MODULE_QT_COMPONENTS})
