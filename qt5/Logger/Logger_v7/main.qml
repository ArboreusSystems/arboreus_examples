// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/02/2021 at 13:41:56
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.12
import QtQuick.Controls 2.12

// Application includes
import "qrc:/ALogger.js" as LOGGER;

// Application
ApplicationWindow {

	property string pText: qsTr("Logger_v7");

	id: oApplicationWindow;
	width: 640;
	height: 480;
	visible: true;
	title: oApplicationWindow.pText;

	Text {

		id: oTestText;
		text: oApplicationWindow.pText;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
	}

	Component.onCompleted: {

		LOGGER.mUserDebug("User DEBUG Message from QML");
		LOGGER.mUserInfo("User INFO Message from QML");
		LOGGER.mUserWarning("User WARNING Message from QML");
		LOGGER.mUserCritical("User CRITICAL Message from QML");

		LOGGER.mQMLDebug("DEBUG Message from QML");
		LOGGER.mQMLInfo("INFO Message from QML");
		LOGGER.mQMLWarning("WARNING Message from QML");
		LOGGER.mQMLCritical("CRITICAL Message from QML");
	}
}
