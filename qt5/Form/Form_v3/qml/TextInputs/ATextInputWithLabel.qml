// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/02/2022 at 18:06:35
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
ATextInputWithLabelTemplate {

	property alias pLabelText: oLabel.text;
	property alias pText: oTextInput.pText;

	id: oRoot;
	width: parent.width;

	pSeparator.data: Rectangle {

		id: oSeparator;
		width: parent.width * 0.4;
		height: 2;
		color: COLORS.mFiolentDark();
	}

	pLabel.data: Text {

		id: oLabel;
		text: "NoDfinedLabelText";
		color: COLORS.mFiolentDark();
		font.pixelSize: 16;
	}

	pInputText.data: ATextInputTemplate {

		id: oTextInput;
		width: parent.width;
		height: 50;
		pSizeBorder: 2;
		pSizeRadius: 3;
		pColorBorderNormal: COLORS.mBlueDark();
		pColorBackgroundNormal: COLORS.mWhite();
		pColorTextNormal: COLORS.mBlackDark();
	}
}
