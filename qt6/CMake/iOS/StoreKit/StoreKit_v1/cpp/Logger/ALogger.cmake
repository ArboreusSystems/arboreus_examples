# ---------------------------------
# ALogger variables

set(A_LOGGER_DIR_ROOT ${CMAKE_CURRENT_LIST_DIR})


# ---------------------------------
# Qt modules definitions

if(NOT "Core" IN_LIST A_TARGET_QT_MODULES)
	set(A_TARGET_QT_MODULES ${A_TARGET_QT_MODULES} Core)
endif()


# ---------------------------------
# ALogger sources

set(A_TARGET_INCLUDE_DIRECTORIES_PRIVATE
	${A_TARGET_INCLUDE_DIRECTORIES_PRIVATE}
	${A_LOGGER_DIR_ROOT}
)

set(A_SOURCES_PRECOMPILED_HEADERS_PRIVATE
	${A_SOURCES_PRECOMPILED_HEADERS_PRIVATE}
	${A_LOGGER_DIR_ROOT}/aloggerpch.h
)

set(A_SOURCES_CPP_HEADERS
	${A_SOURCES_CPP_HEADERS}
	${A_LOGGER_DIR_ROOT}/aloggerglobal.h
	${A_LOGGER_DIR_ROOT}/aloggerdatamodels.h
	${A_LOGGER_DIR_ROOT}/alogger.h
)

set(A_SOURCES_CPP
	${A_SOURCES_CPP}
	${A_LOGGER_DIR_ROOT}/alogger.cpp
)
