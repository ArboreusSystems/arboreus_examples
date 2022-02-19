// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/11/2020 at 20:46:11
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
	color: COLORS.mPurple();
	width: parent.width;
	anchors.bottom: parent.bottom;
	anchors.left: parent.left;
	anchors.right: parent.right;

	Text {

		id: oFooterText;
		text: qsTr("Footer");
		font.bold: true;
		font.capitalization: Font.AllUppercase;
		color: COLORS.mWhite();
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
	}
}
