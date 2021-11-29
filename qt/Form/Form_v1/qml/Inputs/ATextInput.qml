// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/11/2021 at 18:49:10
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Rectangle {

	property alias pText: oTextInput.text;

	id: oRoot;
	color: COLORS.mWhite();
	clip: true;

	TextInput {

		id: oTextInput;
		clip: true;
		leftPadding: 5;
		rightPadding: 5;
		verticalAlignment: Text.AlignVCenter;
		font.pixelSize: AUIConstants.mFontBodySize();
		anchors.fill: parent;
		anchors.margins: oRoot.border.width;
	}
}
