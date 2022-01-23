// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/12/2021 at 14:13:01
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
	objectName: "NoDefinedButtonName"

	contentItem: Text {

		id: oLabel;
		text: oRoot.text;
		anchors.fill: parent;
		color: COLORS.mWhiteLight();
		font.bold: true;
		font.pixelSize: 22;
		horizontalAlignment: Text.AlignHCenter;
		verticalAlignment: Text.AlignVCenter;
	}

	background: Rectangle {

		id: oBackground;
		color: oRoot.pressed ? COLORS.mSalad() : COLORS.mBlueDark();
		anchors.fill: parent;
	}

	onClicked: {

		console.log(oRoot.objectName,"clicked");
	}
}
