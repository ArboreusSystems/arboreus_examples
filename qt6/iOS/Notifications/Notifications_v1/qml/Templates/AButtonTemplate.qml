// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/06/2022 at 14:30:43
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
	text: "NoDefinedButtionText";

	contentItem: Text {

		id: oContent;
		color: COLORS.mWhiteLight();
		text: oRoot.text;
		font.bold: true;
		font.pixelSize: 21;
		horizontalAlignment: Text.AlignHCenter;
		verticalAlignment: Text.AlignVCenter;
		anchors.fill: parent;
	}

	background: Rectangle {

		id: oBackground;
		color: COLORS.mFiolentDark();
		anchors.fill: parent;
	}

	onClicked: {

		console.debug("Clicked button ID:",oRoot.objectName);
	}
}
