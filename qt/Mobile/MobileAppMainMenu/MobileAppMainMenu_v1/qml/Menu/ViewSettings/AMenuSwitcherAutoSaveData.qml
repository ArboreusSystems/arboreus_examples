// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/07/2021 at 12:39:06
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes

// Application paths
import "qrc:/qml/Templates";

// Component
AMenuItemSwitcherTemplate {

	id: oRoot;
	pTextLabel: "Save data";
	pTextNotice: "Automatically save user data";
	pMargin: oApplicationWindow.pMargin;
}
