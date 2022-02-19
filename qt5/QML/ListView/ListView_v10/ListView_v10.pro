QT += quick sql

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
	$$PWD/cpp \
	$$PWD/cpp/Backend \
	$$PWD/cpp/DB \
	$$PWD/cpp/Logger \
	$$PWD/cpp/Properties \
	$$PWD/cpp/Storage \
	$$PWD/cpp/ListViewModel \
	$$PWD/cpp/Templates \
	$$PWD/cpp/Universal

RESOURCES += qml.qrc

HEADERS += \
	cpp/Backend/abackend.h \
	cpp/DB/adbdatamodels.h \
	cpp/DB/adbsqlcipher.h \
	cpp/ListViewModel/alistviewmodel.h \
	cpp/Logger/aloggerdatamodels.h \
	cpp/Logger/aloggerglobal.h \
	cpp/Properties/aproperties.h \
	cpp/Storage/adbrequestadd.h \
	cpp/Storage/adbrequestallordered.h \
	cpp/Storage/astorage.h \
	cpp/Storage/astoragedatamodels.h \
	cpp/Storage/astorageservice.h \
	cpp/Templates/athreadobjectcontrollertemplate.h \
	cpp/Templates/athreadobjecttemplate.h \
	cpp/Templates/athreadservicetemplate.h \
	cpp/Templates/athreadtemplate.h \
	cpp/Universal/adir.h

SOURCES += \
	cpp/Backend/abackend.cpp \
	cpp/DB/adbsqlcipher.cpp \
	cpp/ListViewModel/alistviewmodel.cpp \
	cpp/Properties/aproperties.cpp \
	cpp/Storage/adbrequestadd.cpp \
	cpp/Storage/adbrequestallordered.cpp \
	cpp/Storage/astorage.cpp \
	cpp/Storage/astorageservice.cpp \
	cpp/Universal/adir.cpp \
	main.cpp
