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
    cpp/IOSBackground \
	cpp/Logger

RESOURCES += \
    qml.qrc

HEADERS += \
    cpp/Logger/aloggerdatamodels.h \
    cpp/Logger/aloggerglobal.h

SOURCES += \
	main.cpp

ios {

    LIBS += \
	    -framework Foundation \
		-framework UIKit

    HEADERS += \
    cpp/IOSBackground/aiosappstate.h

    SOURCES += \
    cpp/IOSBackground/aiosappstate.cpp

    OBJECTIVE_HEADERS += \
    cpp/IOSBackground/aiosappdelegate.h

    OBJECTIVE_SOURCES += \
    cpp/IOSBackground/aiosappdelegate.mm
}
