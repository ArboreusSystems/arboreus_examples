# -------------------------------------------------------------------
#  @doc
#  @notice Template file is qtquickapplication/app.pro
# 
#  @copyright Arboreus (http://arboreus.systems)
#  @author Alexandr Kirilov (http://alexandr.kirilov.me)
#  @created 20/09/2019 at 20:40:07
# -------------------------------------------------------------------

QT += quick
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

ios {

	CONFIG -= bitcode

	LIBS += -L$$PWD/libs/openssl_1_1_1_d/ios/lib/ -lcrypto
	PRE_TARGETDEPS += $$PWD/libs/openssl_1_1_1_d/ios/lib/libcrypto.a

	LIBS += -L$$PWD/libs/openssl_1_1_1_d/ios/lib/ -lssl
	PRE_TARGETDEPS += $$PWD/libs/openssl_1_1_1_d/ios/lib/libssl.a
}

macos {

	LIBS += -L$$PWD/libs/openssl_1_1_1_d/macos/lib/ -lcrypto
	PRE_TARGETDEPS += $$PWD/libs/openssl_1_1_1_d/macos/lib/libcrypto.a

	LIBS += -L$$PWD/libs/openssl_1_1_1_d/macos/lib/ -lssl
	PRE_TARGETDEPS += $$PWD/libs/openssl_1_1_1_d/macos/lib/libssl.a

}

simulator {

	LIBS += -L$$PWD/libs/openssl_1_1_1_d/macos/lib/ -lcrypto
	PRE_TARGETDEPS += $$PWD/libs/openssl_1_1_1_d/macos/lib/libcrypto.a

	LIBS += -L$$PWD/libs/openssl_1_1_1_d/macos/lib/ -lssl
	PRE_TARGETDEPS += $$PWD/libs/openssl_1_1_1_d/macos/lib/libssl.a
}

contains(ANDROID_TARGET_ARCH,arm64-v8a) {

		LIBS += -L$$PWD/libs/openssl_1_1_1_d/android/android-arm64/lib/ -lcrypto
		ANDROID_EXTRA_LIBS += $$PWD/libs/openssl_1_1_1_d/android/android-arm64/lib/libcrypto.so

		LIBS += -L$$PWD/libs/openssl_1_1_1_d/android/android-arm64/lib/ -lssl
		ANDROID_EXTRA_LIBS += $$PWD/libs/openssl_1_1_1_d/android/android-arm64/lib/libssl.so
	}

	contains(ANDROID_TARGET_ARCH,armeabi-v7a) {

		LIBS += -L$$PWD/libs/openssl_1_1_1_d/android/android-armeabi/lib/ -lcrypto
		ANDROID_EXTRA_LIBS += $$PWD/libs/openssl_1_1_1_d/android/android-armeabi/lib/libcrypto.so

		LIBS += -L$$PWD/libs/openssl_1_1_1_d/android/android-armeabi/lib/ -lssl
		ANDROID_EXTRA_LIBS += $$PWD/libs/openssl_1_1_1_d/android/android-armeabi/lib/libssl.so
	}

	contains(ANDROID_TARGET_ARCH,x86) {

		LIBS += -L$$PWD/libs/openssl_1_1_1_d/android/android-x86/lib/ -lcrypto
		ANDROID_EXTRA_LIBS += $$PWD/libs/openssl_1_1_1_d/android/android-x86/lib/libcrypto.so

		LIBS += -L$$PWD/libs/openssl_1_1_1_d/android/android-x86/lib/ -lssl
		ANDROID_EXTRA_LIBS += $$PWD/libs/openssl_1_1_1_d/android/android-x86/lib/libssl.so
	}

	contains(ANDROID_TARGET_ARCH,x86_64) {

		LIBS += -L$$PWD/libs/openssl_1_1_1_d/android/android-x86_64/lib/ -lcrypto
		ANDROID_EXTRA_LIBS += $$PWD/libs/openssl_1_1_1_d/android/android-x86_64/lib/libcrypto.so

		LIBS += -L$$PWD/libs/openssl_1_1_1_d/android/android-x86_64/lib/ -lssl
		ANDROID_EXTRA_LIBS += $$PWD/libs/openssl_1_1_1_d/android/android-x86_64/lib/libssl.so
	}

