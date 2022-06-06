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
	$$PWD/cpp/Application \
	$$PWD/cpp/Backend \
	$$PWD/cpp/Logger \
	$$PWD/cpp/Templates

HEADERS += \
	cpp/Application/aapplication.h \
	cpp/Application/aapplicationdelegateinterface.h \
	cpp/Application/aapplicationglobal.h \
	cpp/Application/aapplicationservice.h \
	cpp/Backend/abackend.h \
	cpp/Logger/alogger.h \
	cpp/Logger/aloggerdatamodels.h \
	cpp/Logger/aloggerglobal.h \
	cpp/Logger/aloggerservice.h \
	cpp/Templates/athreadobjectcontrollertemplate.h \
	cpp/Templates/athreadobjecttemplate.h \
	cpp/Templates/athreadservicetemplate.h \
	cpp/Templates/athreadtemplate.h

SOURCES += \
	cpp/Application/aapplication.cpp \
	cpp/Application/aapplicationservice.cpp \
	cpp/Backend/abackend.cpp \
	cpp/Logger/alogger.cpp \
	cpp/Logger/aloggerservice.cpp \
	main.cpp

RESOURCES += \
	qml.qrc

ios {

	CONFIG -= bitcode

	QMAKE_IOS_DEPLOYMENT_TARGET = 13.0
	QMAKE_APPLE_TARGETED_DEVICE_FAMILY = 1

	QMAKE_INFO_PLIST = $$PWD/platforms/iOS/Info.plist

	LIBS += \
		-framework Foundation \
		-framework UIKit

	HEADERS += \
		cpp/Application/aapplicationiosdelegate.h

	SOURCES += \
		cpp/Application/aapplicationiosdelegate.cpp

	OBJECTIVE_HEADERS += \
		cpp/Application/aapplicationiosnativedelegate.h

	OBJECTIVE_SOURCES += \
		cpp/Application/aapplicationiosnativedelegate.mm
}

android {

	HEADERS += \
		cpp/Application/aapplicationandroiddelegate.h \
		cpp/Application/aapplicationandroidnativedelegate.h

	SOURCES += \
		cpp/Application/aapplicationandroiddelegate.cpp \
		cpp/Application/aapplicationandroidnativedelegate.cpp \
}
