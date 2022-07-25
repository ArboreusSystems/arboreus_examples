QT += quick

CONFIG += c++11

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += \
	$$PWD \
	$$PWD/cpp \
	$$PWD/cpp/ApplicationDelegate \
	$$PWD/cpp/Logger

RESOURCES += qml.qrc

HEADERS += \
	cpp/Logger/aloggerdatamodels.h \
	cpp/Logger/aloggerglobal.h

SOURCES += \
	main.cpp

ios {

	HEADERS += \

	SOURCES += \

	OBJECTIVE_HEADERS += \
		cpp/ApplicationDelegate/aapplicationdelegate.h

	OBJECTIVE_SOURCES += \
		cpp/ApplicationDelegate/aapplicationdelegate.mm
}

