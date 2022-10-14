set(A_MODULE_NAME_Asio "A_MODULE_Asio")
set(A_MODULE_DIR_Asio ${CMAKE_CURRENT_SOURCE_DIR})

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick REQUIRED)

set(A_MODULE_ASIO_HEADERS
	"${A_MODULE_DIR_Asio}/aasio.h"
)

set(A_MODULE_ASIO_CPP
	"${A_MODULE_DIR_Asio}/aasio.cpp"
)

add_library(${A_MODULE_NAME_Asio} STATIC
	${A_MODULE_ASIO_HEADERS}
	${A_MODULE_ASIO_CPP}
)
target_include_directories(${A_MODULE_NAME_Asio} INTERFACE
	${A_MODULE_DIR_Asio}
)

target_compile_definitions(${A_MODULE_NAME_Asio}
	PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)

target_link_libraries(${A_MODULE_NAME_Asio}
	PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick
	PUBLIC ${A_MODULE_ASIO_HEADERS}
	PUBLIC ${A_MODULE_ASIO_CPP}
)

message("!!!!!!!!! ${A_TARGET_NAME}")
message("!!!!!!!!! 1111 ${FILES_UNIVERSAL_RESOURCES}")

set(${FILES_ANDROID_HEADERS} ${FILES_ANDROID_HEADERS} "alogger1.h")
message("!!!!!!!!! 2222 ${FILES_ANDROID_HEADERS}")
