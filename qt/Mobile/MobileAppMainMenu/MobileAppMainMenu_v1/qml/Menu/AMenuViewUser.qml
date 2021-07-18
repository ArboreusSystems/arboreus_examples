// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/07/2021 at 11:16:33
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Templates";
import "qrc:/qml/Menu/ViewUser";


// Component
AMenuViewTemplate {

	id: oRoot;
	spacing: 5;

	AMenuGroupUserProfile {}
	AMenuGroupPrivacy {}
	AMenuGroupPassword {}

	Component.onCompleted: {

		oScreenMenuHeader.mSetBackButton(
			true,"Main","qrc:/qml/Menu/AMenuViewMain.qml"
		);
	}
}
