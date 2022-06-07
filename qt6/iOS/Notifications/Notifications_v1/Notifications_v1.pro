QT += quick

CONFIG += c++11

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += \
	$$PWD/cpp/Application \
	$$PWD/cpp/Backend \
	$$PWD/cpp/Logger \
	$$PWD/cpp/Notifications \
	$$PWD/cpp/Templates

HEADERS += \
	cpp/Application/aapplication.h \
	cpp/Application/aapplicationdelegateinterface.h \
	cpp/Application/aapplicationglobal.h \
	cpp/Application/aapplicationservice.h \
	cpp/Backend/abackend.h \
	cpp/Logger/aloggerdatamodels.h \
	cpp/Logger/aloggerglobal.h \
	cpp/Notifications/anotifications.h \
	cpp/Notifications/anotificationsdatamodels.h \
	cpp/Notifications/anotificationsdelegateinterface.h \
	cpp/Notifications/anotificationsglobal.h \
	cpp/Notifications/anotificationsiosnativedelegate.h \
	cpp/Notifications/anotificationsservice.h \
	cpp/Notifications/anotificationstemplates.h \
	cpp/Templates/athreadobjectcontrollertemplate.h \
	cpp/Templates/athreadobjecttemplate.h \
	cpp/Templates/athreadservicetemplate.h \
	cpp/Templates/athreadtemplate.h

SOURCES += \
	cpp/Application/aapplication.cpp \
	cpp/Application/aapplicationservice.cpp \
	cpp/Backend/abackend.cpp \
	cpp/Notifications/anotifications.cpp \
	cpp/Notifications/anotificationsiosnativedelegate.mm \
	cpp/Notifications/anotificationsservice.cpp \
	cpp/Notifications/anotificationstemplates.cpp \
	main.cpp

RESOURCES += \
	qml.qrc

ios {

	CONFIG -= bitcode

	QMAKE_IOS_DEPLOYMENT_TARGET = 13.0
	QMAKE_APPLE_TARGETED_DEVICE_FAMILY = 1

	QMAKE_INFO_PLIST = $$PWD/platforms/ios/Info.plist
	OTHER_FILES += $$QMAKE_INFO_PLIST

	LIBS += \
		-framework UIKit \
		-framework Foundation \
		-framework UserNotifications

	HEADERS += \
		cpp/Application/aapplicationiosdelegate.h

	SOURCES += \
		cpp/Application/aapplicationiosdelegate.cpp

	OBJECTIVE_HEADERS += \
		cpp/Application/aapplicationiosnativedelegate.h \
		cpp/Notifications/anotificationsiosdelegate.h

	OBJECTIVE_SOURCES += \
		cpp/Application/aapplicationiosnativedelegate.mm \
		cpp/Notifications/anotificationsiosdelegate.mm
}

android {

	HEADERS += \
		cpp/Application/aapplicationandroiddelegate.h \
		cpp/Application/aapplicationandroidnativedelegate.h \
		cpp/Notifications/anotifcationsandroiddelegate.h

	SOURCES += \
		cpp/Application/aapplicationandroiddelegate.cpp \
		cpp/Application/aapplicationandroidnativedelegate.cpp \
		cpp/Notifications/anotifcationsandroiddelegate.cpp
}
