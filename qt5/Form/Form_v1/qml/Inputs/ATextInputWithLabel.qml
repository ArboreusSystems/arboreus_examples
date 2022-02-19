// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/11/2021 at 17:34:53
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Layouts 1.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Inputs";


// Component
ATextInputWithLabelTemplate {

	property alias pLabelText: oLabel.text;
	property alias pInputText: oTextInput.pText;

	id: oTextInputName;
	width: parent.width;

	Layout.alignment: Qt.AlignHCenter;

	pSeparator.data: Rectangle {

		id: oSeparator;
		height: 1;
		implicitWidth: parent.width * 0.4
		color: COLORS.mBlueDark();
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
			wrapMode: Text.WordWrap;
			anchors.top: parent.top;
			anchors.topMargin: oLabelWrapper * 0.25;
			anchors.left: parent.left;
			anchors.right: parent.right;
		}
	}

	pTextInput.data: ATextInput {

		id: oTextInput;
		implicitHeight: AUIConstants.mElementHight();
		implicitWidth: parent.width;
		color: COLORS.mWhiteLight();
	}
}
