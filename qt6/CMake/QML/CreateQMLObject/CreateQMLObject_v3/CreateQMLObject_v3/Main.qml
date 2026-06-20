// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/06/2026 at 13:10:54
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;


// Application Main window
Window {

	property string pTitle: "Main Window CreateQMLObject_v1";

	id: oMainWindow;
	width: 640;
	height: 480;
	visible: true;
	title: qsTr(pTitle);

	Component.onCompleted: {

		var oDynamicObject = Qt.createQmlObject(
			"import QtQuick;" +
			"AText {" +
			"	id: oText;" +
			"	text: \"" + oMainWindow.pTitle + "\";" +
			"	anchors.verticalCenter: parent.verticalCenter;" +
			"	anchors.horizontalCenter: parent.horizontalCenter;" +
			"}",
			oMainWindow
		);
		oDynamicObject.color = "blue";
	}
}
