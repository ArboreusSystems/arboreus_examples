// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 10/10/2020 at 15:00:59
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/Colors.js" as COLORS;


// Component
Rectangle {

	property alias pText: oText.text;
	property alias pTextSize: oText.font.pixelSize;
	property alias pTextAlign: oText.horizontalAlignment;
	property alias pTextFamily: oText.font.family;
	property alias pColorText: oText.color;
	property int pPadding: 0;

	id: oRoot;
	height: oText.height + oRoot.pPadding * 2;

	Text {

		id: oText;
		text: AGlobal.mDefaultString();
		color: COLORS.mBlackDark();
		width: parent.width - oRoot.pPadding * 2;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenterOffset: -oText.font.pixelSize * 0.05;
		minimumPixelSize: oText.font.pixelSize;
		font.pixelSize: 25;
		verticalAlignment: Text.AlignVCenter;
		fontSizeMode: Text.Fit;
		wrapMode: Text.WordWrap
	}

	Connections {

		target: AUISkin;
		function onSgSkinChanged() {

			if (typeof oRoot.mSetSkin === "function") {
				oRoot.mSetSkin();
			}
		}
	}
}
