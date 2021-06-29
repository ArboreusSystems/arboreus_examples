// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/06/2021 at 09:27:38
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

	property string pText: qsTr("Properties v3");

	id: oApplicationWindow;
	width: 640;
	height: 480;
	visible: true;
	title: oApplicationWindow.pText;

	Column {

		AText {

			id: oText1;
	//		pCustomText: "Will not be working";
		}

		AText {

			id: oText2;
			text: "Will be working";
		}
	}
}
