// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/11/2021 at 19:52:22
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
	objectName: "NoDefinedObjectName";
	text: "NoDefinedButtonText";

	contentItem: Text {

		id: oText;
		text: oRoot.text;
		color: COLORS.mWhiteLight();
		font.pixelSize: 18;
		font.bold: true;
		anchors.fill: parent;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
	}

	background: Rectangle {

		id: oBackground;
		anchors.fill: parent;
		color: oRoot.pressed ? COLORS.mSaladDark() : COLORS.mBlueDark();
	}

	onClicked: {

		console.log("Clicked",oRoot.objectName);
	}
}
