// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/02/2022 at 13:36:03
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
	implicitWidth: parent.width;
	implicitHeight: 50;

	contentItem: Text {

		id: oText;
		anchors.fill: parent;
		horizontalAlignment: Text.AlignHCenter;
		verticalAlignment: Text.AlignVCenter;
		color: oRoot.pressed ? COLORS.mFiolentDark() : COLORS.mWhiteLight();
		font.pixelSize: 16;
		text: oRoot.text;
	}

	background: Rectangle {

		id: oBackground;
		anchors.fill: parent;
		color: oRoot.pressed ? COLORS.mSaladLight() : COLORS.mPurpleDark();
	}

	onClicked: {

		console.log(oRoot.objectName,"onClicked");
	}
}
