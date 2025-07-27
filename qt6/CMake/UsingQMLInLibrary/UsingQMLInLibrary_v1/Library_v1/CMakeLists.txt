cmake_minimum_required(VERSION 3.16)

set(A_NAME_TARGET Library_v1)

project(${A_NAME_TARGET} LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core)

qt_add_library(${A_NAME_TARGET} STATIC
	Library_v1_global.h
	library_v1.cpp
	library_v1.h
)

target_link_libraries(${A_NAME_TARGET} PRIVATE Qt${QT_VERSION_MAJOR}::Core)

target_compile_definitions(${A_NAME_TARGET}
	PRIVATE
		LIBRARY_V1_LIBRARY
)

qt_add_qml_module(${A_NAME_TARGET}
	URI "Library_v1"
	QML_FILES
		"ATestQML.qml"
)
