// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/06/2021 at 18:54:29
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes


// Component
Rectangle {

	property alias pValue: oInput.text;

	id: oRoot;
	height: 50;
	border.width: 1;
	radius: 5;

	TextInput {

		id: oInput;
		anchors.fill: parent;
		leftPadding: 10;
		rightPadding: 10;
		verticalAlignment: Text.AlignVCenter;
		font.pixelSize: 20;
	}
}
