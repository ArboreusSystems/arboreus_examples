# --------------------------
# Project settings

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)


# --------------------------
# Qt settings

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)


# --------------------------
# Time consumption report for each of step of build process

set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CMAKE_COMMAND} -E time")
set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK "${CMAKE_COMMAND} -E time")


# --------------------------
# Show warning on wrong pch-file

add_compile_options(-Winvalid-pch)


# --------------------------
# Show path of header file

if (${A_BUILD_SHOW_HEADERS})
	message(STATUS "Build show header paths enabled")
	add_compile_options(-H)
else()
	message(STATUS "Build show header paths disabled")
endif()


# --------------------------
# Show build time report

if (${A_BUILD_SHOW_TIME_REPORT})
	message(STATUS "Build time report enabled")
	add_compile_options(-ftime-report)
else()
	message(STATUS "Build time report disabled")
endif()
