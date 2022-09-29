QT += quick

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
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

A_PRI_EXAMPLES_CONFIG = $$PWD/../../../Examples.conf.pri
exists($$A_PRI_EXAMPLES_CONFIG) {
	include($$A_PRI_EXAMPLES_CONFIG)
} else {
	error(No examples config file $$A_PRI_EXAMPLES_CONFIG)
}

A_PRI_BOOST_ASIO_1_24_0 = $$A_DIR_BOOST/Asio_1_24_0.pri
exists($$A_PRI_BOOST_ASIO_1_24_0) {
	include($$A_PRI_BOOST_ASIO_1_24_0)
} else {
	error(No Boost Asio 1.24.0 config file $$A_PRI_BOOST_ASIO_1_24_0)
}

PRECOMPILED_HEADER += aasiopch.h

HEADERS += \
	aasiopch.h
