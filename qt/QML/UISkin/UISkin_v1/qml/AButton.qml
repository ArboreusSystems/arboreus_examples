// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/09/2020 at 08:38:50
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes


// Component
Button {

	property string pText: "Default";

	id: oButtonRoot;
	objectName: "Default Button Name";

	contentItem: Text {

		id: oButtonText;
		text: qsTr(pText);
		color: ASkin.mGetColorFor("button_text");
		width: oButtonRoot.width;
		height: oButtonRoot.height;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		font.bold: true;
		font.pixelSize: oButtonRoot.height * 0.35;
	}

	background: Rectangle {

		id: oButtonBackground;
		color: ASkin.mGetColorFor("button_background");
	}

	Connections {

		target: ASkin;
		function onSgSkinChanged() {

			oButtonText.color = ASkin.mGetColorFor("button_text");
			oButtonBackground.color = ASkin.mGetColorFor("button_background");
			ALogger.mWriteToLog("Skin changed for button: " + oButtonRoot.objectName);
		}
	}
}
