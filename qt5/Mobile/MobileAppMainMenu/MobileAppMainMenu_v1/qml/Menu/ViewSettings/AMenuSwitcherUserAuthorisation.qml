// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/07/2021 at 12:25:36
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
	pTextLabel: "User authorisation";
	pTextNotice: "User authroisation at time of login";
	pMargin: oApplicationWindow.pMargin;
}
