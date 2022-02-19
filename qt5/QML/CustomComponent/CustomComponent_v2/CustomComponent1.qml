// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/05/2021 at 09:05:43
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes


// Component
Rectangle {

	property alias pLeftBlock: oLeftBlock.data;
	property alias pRightBlock: oRightBlock.data;
	property int pPadding: 0;
	property int pElementHight: 0;

	id: oRoot
	height: oLeftBlock.height + oRoot.pPadding * 2;
	color: "yellow";

	Rectangle {

		id: oLeftBlock;
		height: oRoot.pElementHight;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.left: parent.left;
		anchors.leftMargin: oRoot.pPadding;
		color: "green";
	}

	Rectangle {

		id: oRightBlock;
		height: oRoot.pElementHight;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.right: parent.right;
		anchors.rightMargin: oRoot.pPadding;
		color: "blue";
	}
}
