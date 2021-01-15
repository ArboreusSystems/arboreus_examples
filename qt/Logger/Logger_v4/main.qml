// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/12/2020 at 19:54:22
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes


// Application window component
ApplicationWindow {

	property string pTestText: qsTr("Logger v4");

	id: oApplicationWindow;
	visible: true;
	width: 640;
	height: 480;
	title: oApplicationWindow.pTestText;

	Text {

		id: oTestText;
		text: oApplicationWindow.pTestText;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
	}

	Component.onCompleted: {

		ALogger.mWriteToLog("onCompleted test logger message");
	}

	Component.onDestruction: {

		ALogger.mWriteToLog("onDestruction test logger message");
	}
}
