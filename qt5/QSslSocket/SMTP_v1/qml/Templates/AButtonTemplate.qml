// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/01/2022 at 09:05:13
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes


// Component
Button {

	required property string pObjectName;

	property alias pTextColor: oText.color;
	property alias pTextBold: oText.font.bold;
	property alias pTextPixelSize: oText.font.pixelSize;

	id: oRoot;
	objectName: oRoot.pObjectName;

	contentItem: Text {

		id: oText;
		text: oRoot.text;
		anchors.fill: parent;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
	}

	onClicked: {

		console.log(oRoot.objectName,"clicked");
	}
}
