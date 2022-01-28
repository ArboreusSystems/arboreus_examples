// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/01/2022 at 17:50:17
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
AInputTextWithLabelTemplate {

	property alias pTextLabel: oLabel.text;
	property alias pTextInput: oInputText.pText;

	id: oRoot;
	width: parent.width;


	pSeparator.data: Rectangle {

		id: oSeparator;
		height: 1;
		implicitWidth: parent.width * 0.4;
		color: COLORS.mWhite();
	}

	pLabel.data: Rectangle {

		property real pPaddingValue: oLabel.font.pixelSize * 0.5;

		id: oLabelWrapper;
		implicitWidth: parent.width;
		implicitHeight: oLabel.height + oLabelWrapper.pPaddingValue;
		color: COLORS.mTransparent();

		Text {

			id: oLabel;
			text: "NoDefinedLabelText";
			color: COLORS.mWhiteLight();
			font.pixelSize: 16;
			wrapMode: Text.WordWrap;
			anchors.top: parent.top;
			anchors.topMargin: oLabelWrapper * 0.25;
			anchors.left: parent.left;
			anchors.right: parent.right;
		}
	}

	pInputText.data: AInputText {

		id: oInputText;
		implicitHeight: 45;
		implicitWidth: parent.width;
		color: COLORS.mWhite();
	}
}

