// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 05/10/2021 at 11:25:27
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
	objectName: "NoObjectName";
	text: "NoText";
	width: 100;
	height: parent.height * 0.65;
	anchors.verticalCenter: parent.verticalCenter;

	background: Rectangle {

		color: oRoot.down ? COLORS.mOrangeDark() : COLORS.mSaladDark();
		anchors.fill: parent;
	}

	contentItem: Text {

		text: oRoot.text;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		color: COLORS.mWhite();
		font.bold: true;
		font.pixelSize: 18;
		horizontalAlignment: Text.AlignHCenter;
		verticalAlignment: Text.AlignVCenter;
	}

	onClicked: {

		console.log(oRoot.objectName,"clicked");
	}
}
