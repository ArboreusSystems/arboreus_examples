QT += quick

CONFIG += c++11

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += \
	$$PWD/rust \
	$$PWD/rust/lib/include

HEADERS += \
	$$PWD/rust/lib/include/UsingRust_v1.h \
	$$PWD/rust/arustwrapper.h

SOURCES += \
	$$PWD/main.cpp \
	$$PWD/rust/arustwrapper.cpp

RESOURCES += \
	qml.qrc


ios {

	LIBS += -L$$PWD/rust/lib/ios -lUsingRustLib_v1

}

macos {

	LIBS += -L$$PWD/rust/lib/macos -lUsingRustLib_v1

}

android {

	contains(ANDROID_TARGET_ARCH,arm64-v8a) {

		LIBS += -L$$PWD/rust/lib/android/arm64_v8a -lUsingRustLib_v1

	}

	contains(ANDROID_TARGET_ARCH,armeabi-v7a) {

		LIBS += -L$$PWD/rust/lib/android/armeabi_v7a -lUsingRustLib_v1

	}

	contains(ANDROID_TARGET_ARCH,x86) {

		LIBS += -L$$PWD/rust/lib/android/x86 -lUsingRustLib_v1

	}

	contains(ANDROID_TARGET_ARCH,x86_64) {

		LIBS += -L$$PWD/rust/lib/android/x86_64 -lUsingRustLib_v1

	}
}
