A_PRI_CONFIG = $$(A_DIR_USING_JAVA)/Config.pri
exists($$A_PRI_CONFIG) {

	include($$A_PRI_CONFIG)

	A_PRI_MODULES = $$PWD/Modules.pri
	exists($$A_PRI_MODULES) { include($$A_PRI_MODULES) }
	else { error(No file $$A_PRI_MODULES) }

	QT += quick

	CONFIG += c++11

	SOURCES += \
		main.cpp

	RESOURCES += \
		qml.qrc

	QML_IMPORT_PATH =

	QML_DESIGNER_IMPORT_PATH =

	qnx: target.path = /tmp/$${TARGET}/bin
	else: unix:!android: target.path = /opt/$${TARGET}/bin
	!isEmpty(target.path): INSTALLS += target

	macos {

	}

	ios {

	}

	android {

		QT += androidextras

	}

} else { error(No file $$A_PRI_CONFIG) }
