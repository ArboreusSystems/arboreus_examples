// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/07/2021 at 22:20:46
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
	property double pMargin: 0;

	id: oRootHeaderTemplate;
	width: parent.width;
	height: 75;

	Item {

		id: oLeftBlock;
		height: oRootHeaderTemplate.height;
		anchors.left: oRootHeaderTemplate.left;
		anchors.leftMargin: oRootHeaderTemplate.pMargin;
		anchors.verticalCenter: oRootHeaderTemplate.verticalCenter;
	}

	Item {

		id: oRightBlock;
		height: oRootHeaderTemplate.height;
		anchors.right: oRootHeaderTemplate.right;
		anchors.rightMargin: oRootHeaderTemplate.pMargin;
		anchors.verticalCenter: oRootHeaderTemplate.verticalCenter;
	}
}
