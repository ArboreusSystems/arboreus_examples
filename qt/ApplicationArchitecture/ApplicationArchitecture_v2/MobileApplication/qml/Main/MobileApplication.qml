// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/10/2020 at 11:55:54
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
	title: qsTr("Mobile application");

	Text {

		id: oTestText;
		text: qsTr("Mobile application");
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		font.pixelSize: 30;
		font.bold: true;
	}
}
