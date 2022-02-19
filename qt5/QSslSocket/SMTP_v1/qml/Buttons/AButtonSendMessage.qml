// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/01/2022 at 21:01:57
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Templates";


// Component
AButtonTemplate {

	id: oRoot;
	text: "Send";
	pObjectName: "ButtonSendMessage";
	pTextColor: COLORS.mWhiteLight();
	pTextPixelSize: 22;
	pTextBold: true;

	background: Rectangle {

		id: oBackground;
		color: oRoot.pressed ? COLORS.mRedDark() : COLORS.mOrangeDark();
		anchors.fill: parent;
	}
}
