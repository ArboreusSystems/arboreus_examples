// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/09/2020 at 08:54:17
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes


// Component
Rectangle {

	property int pPadding: 5;
	property alias pText: oText.text;
	property alias pTextSize: oText.font.pixelSize;
	property alias pTextBold: oText.font.bold;

	id: oTextBackground;
	color: ASkin.mGetColorFor("text_background");
	objectName: "Default text name";

	Text {

		id: oText;
		color: ASkin.mGetColorFor("text");
		width: oTextBackground.width - pPadding * 2;
		height: oTextBackground.height - pPadding * 2;
		wrapMode: Text.WordWrap;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		anchors.verticalCenter: oTextBackground.verticalCenter;
		anchors.horizontalCenter: oTextBackground.horizontalCenter;
	}

	Connections {

		target: ASkin;
		function onSgSkinChanged() {

			oTextBackground.color = ASkin.mGetColorFor("text_background");
			oText.color = ASkin.mGetColorFor("text");
			ALogger.mWriteToLog("Skin changed for text: " + oTextBackground.objectName);
		}
	}
}

