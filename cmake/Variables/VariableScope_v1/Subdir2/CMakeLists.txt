set(A_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

set(ARRAY
	${ARRAY}
	"Subdir2"
)

set(A_SOURCES
	${A_SOURCES}
	${A_ROOT_DIR}/asubdir2.h
	${A_ROOT_DIR}/asubdir2.cpp
	PARENT_SCOPE
)
