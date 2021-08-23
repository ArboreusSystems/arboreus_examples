// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/08/2021 at 17:54:59
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Column {

	property alias pLabelText: oLabel.text;
	property alias pText: oTextInput.text;
	property int pSizeBorder: 2;

	id: oRoot;
	spacing: 5;
	width: parent.width;

	Text {

		id: oLabel;
		text: "NoDefinedLabel";
	}

	Rectangle {

		id: oBorder;
		width: parent.width;
		height: 40;
		color: COLORS.mBlueDark();

		Rectangle {

			id: oBackground;
			width: parent.width - oRoot.pSizeBorder * 2;
			height: parent.height - oRoot.pSizeBorder * 2;
			anchors.centerIn: parent;
			color: COLORS.mWhite();
			clip: true;

			TextInput {

				id: oTextInput;
				anchors.fill: parent;
				font.bold: true;
				font.pixelSize: 18;
				leftPadding: 5;
				rightPadding: 5;
				verticalAlignment: Text.AlignVCenter;
			}
		}
	}
}
