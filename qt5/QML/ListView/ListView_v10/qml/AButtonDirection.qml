// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/10/2021 at 12:26:51
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
		color: oRoot.down ? COLORS.mSaladDark() : COLORS.mBlueLight();
	}

	states: [

		State {name: "Ascendant"; PropertyChanges {target: oButtonText; text: "a";}},
		State {name: "Descendant"; PropertyChanges {target: oButtonText; text: "d";}}
	]
}
