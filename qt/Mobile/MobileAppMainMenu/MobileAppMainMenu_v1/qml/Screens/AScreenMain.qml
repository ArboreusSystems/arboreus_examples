// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/07/2021 at 23:11:52
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Templates";
import "qrc:/qml/Header";


// Component
AScreenTemplate {

	id: oRoot;
	objectName: "AScreenMain";
	color: COLORS.mGreyLight();

	AHeaderMain {

		id: oHeader;
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.right: parent.right;
	}

	Text {

		id: oLabel;
		text: "Screen Main";
		anchors.centerIn: parent;
		font.pixelSize: 24;
		font.bold: true;
	}
}
