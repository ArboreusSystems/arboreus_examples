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
	$$PWD/cpp/Backend \
	$$PWD/cpp/Cache \
	$$PWD/cpp/Logger \
	$$PWD/cpp/SMTP \
	$$PWD/cpp/Templates

HEADERS += \
	cpp/Backend/abackend.h \
	cpp/Cache/acache.h \
	cpp/Cache/acachedatamodels.h \
	cpp/Logger/aloggerdatamodels.h \
	cpp/Logger/aloggerglobal.h \
	cpp/SMTP/asmtp.h \
	cpp/SMTP/asmtpdatamodels.h \
	cpp/SMTP/asmtpservice.h \
	cpp/Templates/athreadobjectcontrollertemplate.h \
	cpp/Templates/athreadobjecttemplate.h \
	cpp/Templates/athreadservicetemplate.h \
	cpp/Templates/athreadtemplate.h

SOURCES += \
	cpp/Backend/abackend.cpp \
	cpp/Cache/acache.cpp \
	cpp/SMTP/asmtp.cpp \
	cpp/SMTP/asmtpservice.cpp \
	main.cpp

RESOURCES += \
	qml.qrc
