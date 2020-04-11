// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/10/2019 at 14:44:00
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.12

// Application includes


// Component
Rectangle {

	property alias pLeft: oLeftPart.data;
	property alias pRight: oRightPart.data;

	id: oRoot;
	width: parent.width;
	color: "grey";

	Row {

		id: oLeftPart;
		anchors.left: parent.left;
		anchors.verticalCenter: parent.verticalCenter;
		spacing: 3;
	}

	Row {

		id: oRightPart;
		anchors.right: parent.right;
		anchors.verticalCenter: parent.verticalCenter;
		spacing: 3;
	}
}






