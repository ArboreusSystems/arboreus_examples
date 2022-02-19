// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/08/2021 at 15:56:50
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

	contentItem: Text {

		id: oButtonText;
		text: "+";
		font.bold: true;
		font.pixelSize: 24;
		color: COLORS.mWhiteLight();
		width: parent.width;
		height: parent.height;
		anchors.centerIn: parent;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
	}

	background: Rectangle {

		id: oButtonBackground;
		anchors.fill: parent;
		color: oRoot.down ? COLORS.mSaladDark() : COLORS.mFiolentDark();
	}
}
