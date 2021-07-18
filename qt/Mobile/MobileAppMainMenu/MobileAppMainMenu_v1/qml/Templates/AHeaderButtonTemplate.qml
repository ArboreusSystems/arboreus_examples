// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2021 at 14:41:04
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

	id: oRoot;
	objectName: "ButtonNameUndefined";
	width: oRoot.height;
	anchors.verticalCenter: parent.verticalCenter;

	background: Rectangle {

		id: oBackground;
		color: oRoot.down ? COLORS.mSalad() : COLORS.mFiolent();
	}

	contentItem: Text {

		id: oText;
		anchors.fill: parent;
		text: oRoot.text;
		color: COLORS.mWhite();
		font.pixelSize: 20;
		font.bold: true;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
	}

	onClicked: {

		console.log("Clicked",oRoot.objectName);
	}
}
