// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2021 at 14:56:24
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths


// Component
Text {

	id: oRoot;
	color: COLORS.mWhiteLight();
	font.bold: true;
	font.pixelSize: 20;
	verticalAlignment: Text.AlignVCenter;
	anchors.verticalCenter: parent.verticalCenter;
}
