// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/07/2021 at 11:42:21
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Button {

	property double pMargin: 0;
	property string pText: "NoDefinedLabelText";
	property string pSource: "NoDefinedSource";

	id: oRoot;
	objectName: "MenuButtonBack";
	anchors.verticalCenter: parent.verticalCenter;

	background: Rectangle {

		id: oBackground;
		color: oRoot.down ? COLORS.mSalad() : COLORS.mTransparent();
	}

	contentItem: Row {

		id: oContentItem;
		height: parent.height;
		anchors.left: parent.left;
		spacing: 5;

		Text {

			id: oSignBack;
			text: "<";
			color: COLORS.mWhiteLight();
			font.bold: true;
			font.pixelSize: 24;
			anchors.verticalCenter: parent.verticalCenter;
		}

		Text {

			id: oLabel;
			text: oRoot.pText;
			color: COLORS.mWhiteLight();
			font.bold: true;
			font.pixelSize: 18;
			anchors.verticalCenter: parent.verticalCenter;
		}
	}

	onClicked: {

		console.log("Clicked",oRoot.objectName);
		oMenuLoader.source = oRoot.pSource;
	}
}
