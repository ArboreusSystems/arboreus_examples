// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/11/2020 at 20:41:04
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColor.js" as COLORS;


// Component
Rectangle {

	id: oRoot;
	color: COLORS.mGreen();
	width: parent.width;
	anchors.top: parent.top;
	anchors.left: parent.left;
	anchors.right: parent.right;

	Text {

		id: oFooterText;
		text: qsTr("Header");
		font.bold: true;
		font.capitalization: Font.AllUppercase;
		color: COLORS.mWhite();
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
	}
}
