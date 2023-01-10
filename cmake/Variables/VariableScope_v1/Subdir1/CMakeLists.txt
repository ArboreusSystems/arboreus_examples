set(A_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

message(STATUS "TYPE in Child before set: ${TYPE}")

set(TYPE "Child" PARENT_SCOPE)

set(ARRAY
	${ARRAY}
	"Subdir1"
	PARENT_SCOPE
)

set(A_SOURCES
	${A_SOURCES}
	${A_ROOT_DIR}/asubdir1.h
	${A_ROOT_DIR}/asubdir1.cpp
	PARENT_SCOPE
)

