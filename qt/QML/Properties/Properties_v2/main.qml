// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/06/2021 at 15:31:26
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes

// Application paths
import "qrc:/qml";


// Application
ApplicationWindow {

	property string pText: qsTr("Properties v2");

	id: oApplicationWindow;
	width: 640;
	height: 480;
	visible: true;
	title: oApplicationWindow.pText;

	ARectangle {

		id: oRectangle;
		width: 50;
		height: 50;

		color: "red";
	}
}
