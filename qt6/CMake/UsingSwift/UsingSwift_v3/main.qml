// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/01/2023 at 11:47:20
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes

// Application
ApplicationWindow {

	property string pText: qsTr("Using Swift v3");

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
}
