QT += quick network

CONFIG += c++11

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
	$$PWD/cpp/Application \
	$$PWD/cpp/Backend \
	$$PWD/cpp/Logger \
	$$PWD/cpp/Templates

HEADERS += \
	cpp/Application/aapplication.h \
	cpp/Application/aapplicationservice.h \
	cpp/Backend/abackend.h \
	cpp/Logger/aloggerdatamodels.h \
	cpp/Logger/aloggerglobal.h \
	cpp/Templates/athreadobjectcontrollertemplate.h \
	cpp/Templates/athreadobjecttemplate.h \
	cpp/Templates/athreadservicetemplate.h \
	cpp/Templates/athreadtemplate.h

SOURCES += \
	cpp/Application/aapplication.cpp \
	cpp/Application/aapplicationservice.cpp \
	cpp/Backend/abackend.cpp \
	main.cpp

RESOURCES += \
	qml.qrc

ios {

	LIBS += \
		-framework Foundation \
		-framework UIKit

	OBJECTIVE_HEADERS += \
		cpp/Application/aapplicationiosdelegate.h

	OBJECTIVE_SOURCES += \
		cpp/Application/aapplicationiosdelegate.mm
}
