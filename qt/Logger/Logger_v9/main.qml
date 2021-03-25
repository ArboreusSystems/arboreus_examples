// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 15:21:32
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/ALogger.js" as ALOGGER

// Application
ApplicationWindow {

	property string pText: qsTr("Logger v9");

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

		ALOGGER.mQMLInfo("QML Info");
		ALOGGER.mQMLWarning("QML Warning");
		ALOGGER.mQMLCritical("QML Critical");
	}
}
