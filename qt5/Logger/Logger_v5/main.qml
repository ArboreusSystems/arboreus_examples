// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/10/2020 at 21:19:16
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes


// Application window component
ApplicationWindow {

	property string pText: qsTr("Logger v5");

	id: oMainWindow;
	visible: true;
	width: 640;
	height: 480;
	title: oMainWindow.pText;

	Text {

		id: oTestText;
		text: oMainWindow.pText;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
	}

	Component.onCompleted: {

		console.log("console.log QML");
		console.debug("console.debug from QML");
		console.info("console.info from QML");
		console.warn("console.warn from QML");
		console.error("console.error from QML");
	}
}
