// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/01/2022 at 20:37:20
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes


// Component
AMouseAreaTemplate {

	property alias pSwipeMenu: oSwipeMenu;
	property alias pHoldMenu: oHoldMenu;

	id: oRoot;
	height: oRoot.children.height;

	Item {

		id: oSwipeMenu;
		anchors.fill: parent;
	}

	Item {

		id: oHoldMenu;

	}

	function mShowHoldMenu(inVisible) {

		oHoldMenu.visible = inVisible;
	}
}
