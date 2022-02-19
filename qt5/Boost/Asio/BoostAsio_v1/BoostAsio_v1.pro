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

KRN_DIR_ARBOREUS_BOOST = /Users/alexandr/Projects/arboreus/arboreus_boost
KRN_PRI_ARBOREUS_BOOST_ASIO = $$KRN_DIR_ARBOREUS_BOOST/ArboreusBoostAsio.pri
exists($$KRN_PRI_ARBOREUS_BOOST_ASIO) {
	include($$KRN_PRI_ARBOREUS_BOOST_ASIO)
} else {
	error(No Arboreus Boost.Asio config file $$KRN_PRI_ARBOREUS_BOOST_ASIO)
}

SOURCES += \
	main.cpp

RESOURCES += \
	qml.qrc
