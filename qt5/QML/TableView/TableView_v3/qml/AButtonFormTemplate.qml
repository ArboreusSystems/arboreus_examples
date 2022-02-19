// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/08/2021 at 17:33:29
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
	width: parent.width;
	height: 50;

	contentItem: Text {

		id: oContent;
		text: oRoot.text;
		color: COLORS.mWhiteLight();
		anchors.fill: parent;
		font.bold: true;
		font.pixelSize: 20;
		horizontalAlignment: Text.AlignHCenter;
		verticalAlignment: Text.AlignVCenter;
	}

	background: Rectangle {

		id: oBackground;
		anchors.fill: parent;
		color: oRoot.down ? COLORS.mSaladDark() : COLORS.mBlueDark();
	}

	onClicked: {

		console.log("Clicked button:",oRoot.objectName);
	}
}
