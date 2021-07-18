// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/07/2021 at 11:12:56
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes

// Application paths
import "qrc:/qml/Templates";


// Component
AMenuItemGroupTemplate {

	id: oRoot;
	objectName: "ViewMain.Settings";
	pText: "Settings";
	pMargin: oApplicationWindow.pMargin;

	function mOnClicked() {

		oMenuLoader.source = "qrc:/qml/Menu/AMenuViewSettings.qml";
	}
}
