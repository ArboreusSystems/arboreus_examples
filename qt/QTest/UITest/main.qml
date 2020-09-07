// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/09/2020 at 17:35:27
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Window 2.15

// Application includes


// Application window component
Window {

	id: oMainWindow;
	visible: true;
	width: 640;
	height: 480;
	title: qsTr("Hello World");

	Component.onCompleted: {

		ALogger.mWriteToLog("kjjkjkj");
	}
}
