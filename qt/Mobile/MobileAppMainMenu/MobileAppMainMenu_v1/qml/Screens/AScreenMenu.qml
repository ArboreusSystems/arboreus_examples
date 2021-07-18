// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/07/2021 at 23:31:13
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Templates";
import "qrc:/qml/Header";


// Component
AScreenTemplate {

	id: oRoot;
	objectName: "AScreenMenu";
	color: COLORS.mSaladLight();

	AHeaderMenu {

		id: oScreenMenuHeader;
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.right: parent.right;
	}

	ScrollView {

		id: oApplicationMenu;
		anchors.top: oScreenMenuHeader.bottom;
		anchors.bottom: oRoot.bottom;
		anchors.left: oRoot.left;
		anchors.right: oRoot.right;

		Loader {

			id: oMenuLoader;
			width: parent.width;
			source: "qrc:/qml/Menu/AMenuViewMain.qml";
		}
	}
}
