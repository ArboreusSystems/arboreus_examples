QT += quick network

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += \
	$$PWD/cpp/Logger \
	$$PWD/cpp/IMAP

HEADERS += \
	cpp/IMAP/aimap.h \
	cpp/IMAP/aimapdatamodels.h \
	cpp/Logger/aloggerdatamodels.h \
	cpp/Logger/aloggerglobal.h

SOURCES += \
	cpp/IMAP/aimap.cpp \
	main.cpp

RESOURCES += \
	qml.qrc
