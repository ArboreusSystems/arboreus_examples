QT += quick

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += \
	$$PWD \
	$$PWD/cpp/Backend \
	$$PWD/cpp/Logger \
	$$PWD/cpp/Swift \
	$$PWD/cpp/Templates

RESOURCES += \
	$$PWD/qml.qrc

HEADERS += \
	$$PWD/cpp/Backend/abackend.h \
	$$PWD/cpp/Logger/alogger.h \
	$$PWD/cpp/Logger/aloggerdatamodels.h \
	$$PWD/cpp/Logger/aloggerglobal.h \
	$$PWD/cpp/Logger/aloggerservice.h \
	$$PWD/cpp/Templates/athreadobjectcontrollertemplate.h \
	$$PWD/cpp/Templates/athreadobjecttemplate.h \
	$$PWD/cpp/Templates/athreadservicetemplate.h \
	$$PWD/cpp/Templates/athreadtemplate.h

SOURCES += \
	$$PWD/cpp/Backend/abackend.cpp \
	$$PWD/cpp/Logger/alogger.cpp \
	$$PWD/cpp/Logger/aloggerservice.cpp \
	$$PWD/main.cpp

ios {

	HEADERS += \
		$$PWD/cpp/Swift/aswiftbridging.h \
		$$PWD/cpp/Swift/aswift.h \
		$$PWD/cpp/Swift/aswiftiosnative.h

	SOURCES += \
		$$PWD/cpp/Swift/aswift.cpp

	OBJECTIVE_HEADERS += \
		$$PWD/cpp/Swift/aswiftiosobjc.h

	OBJECTIVE_SOURCES += \
		$$PWD/cpp/Swift/aswiftiosnative.mm

	SWIFT_SOURCES += \
		$$PWD/cpp/Swift/Swift/aswiftiosswift.swift

	XCODE_SWIFT_VERSION.name = SWIFT_VERSION
	XCODE_SWIFT_VERSION.value = 5.0
	QMAKE_MAC_XCODE_SETTINGS += XCODE_SWIFT_VERSION

	XCODE_SWIFT_OBJC_BRIDGING_HEADER_FILE = $$PWD/cpp/Swift/aswiftbridging.h
	XCODE_SWIFT_OBJC_BRIDGING_HEADER.name = SWIFT_OBJC_BRIDGING_HEADER
	XCODE_SWIFT_OBJC_BRIDGING_HEADER.value = $$XCODE_SWIFT_OBJC_BRIDGING_HEADER_FILE
	QMAKE_MAC_XCODE_SETTINGS += XCODE_SWIFT_OBJC_BRIDGING_HEADER

	XCODE_SWIFT_OBJC_INTERFACE_GENERATED_HEADER_NAME = aswiftobjcinterface.h
	XCODE_SWIFT_OBJC_INTERFACE_HEADER_NAME.name = SWIFT_OBJC_INTERFACE_HEADER_NAME
	XCODE_SWIFT_OBJC_INTERFACE_HEADER_NAME.value = $$XCODE_SWIFT_OBJC_INTERFACE_GENERATED_HEADER_NAME
	QMAKE_MAC_XCODE_SETTINGS += XCODE_SWIFT_OBJC_INTERFACE_HEADER_NAME

	XCODE_ENABLE_BITCODE.name = ENABLE_BITCODE
	XCODE_ENABLE_BITCODE.value = NO
	QMAKE_MAC_XCODE_SETTINGS += XCODE_ENABLE_BITCODE

	XCODE_ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES.name = ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES
	XCODE_ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES.value = YES
	QMAKE_MAC_XCODE_SETTINGS += XCODE_ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES

	SWIFT.input = SWIFT_SOURCES
	SWIFT.variable_out = OBJECT
	SWIFT.output = ${QMAKE_FILE_IN}
	SWIFT.dependency_type = TYPE_C
	QMAKE_EXTRA_COMPILERS += SWIFT
}

macos {

}

