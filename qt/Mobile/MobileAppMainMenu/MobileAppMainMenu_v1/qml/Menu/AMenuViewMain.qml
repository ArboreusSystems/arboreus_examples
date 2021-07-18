// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2021 at 16:40:51
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Templates";
import "qrc:/qml/Menu/ViewMain";


// Component
AMenuViewTemplate {

	id: oRoot;
	spacing: 5;

	AMenuGroupUser {}
	AMenuGroupSettings {}

	Component.onCompleted: {

		oScreenMenuHeader.mSetBackButton(false,"","");
	}
}
