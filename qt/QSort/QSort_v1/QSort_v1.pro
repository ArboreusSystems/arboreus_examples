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
	$$PWD/cpp

HEADERS += \
	cpp/aloggerdatamodels.h \
	cpp/aloggerglobal.h \
	cpp/arandom.h \
	cpp/arandomdatamodels.h \
	cpp/asort.h \
	cpp/asortdatamodels.h

SOURCES += \
	cpp/arandom.cpp \
	cpp/asort.cpp \
	main.cpp

RESOURCES += qml.qrc
