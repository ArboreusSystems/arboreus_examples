// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/04/2021 at 17:07:43
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/AColors.js" as COLORS;


// Component
AScreen {

	id: oRoot;
	color: COLORS.mSalad();

	Text {

		id: oTextLoadingScreen;
		text: qsTr("Loading ...");
		color: COLORS.mWhite();
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		font.pixelSize: 25;
		font.bold: true;
	}
}
