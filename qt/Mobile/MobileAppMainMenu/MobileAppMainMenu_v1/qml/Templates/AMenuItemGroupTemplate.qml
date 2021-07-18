// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2021 at 17:31:53
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
AMenuItemTemplate {

	property alias pText: oLabel.text;

	id: oRoot;
	objectName: "NoDefinedObjectName";
	height: 50;
	color: oMouseArea.pressed ? COLORS.mSalad() : COLORS.mGreenDark();

	Text {

		id: oLabel;
		text: "NoDefinedLabel";
		color: COLORS.mWhiteLight();
		font.bold: true;
		font.pixelSize: 16;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.left: parent.left;
		anchors.leftMargin: oRoot.pMargin;
	}

	Text {

		id: oSign;
		text: ">";
		color: COLORS.mWhiteLight();
		font.bold: true;
		font.pixelSize: 24;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.right: parent.right;
		anchors.rightMargin: oRoot.pMargin;
	}

	MouseArea {

		id: oMouseArea;
		anchors.fill: parent;

		onClicked: {

			console.log("Clicked menu group",oRoot.objectName);

			if (typeof oRoot.mOnClicked === "function") {
				oRoot.mOnClicked();
			}
		}
	}
}
