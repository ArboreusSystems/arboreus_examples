// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/09/2020 at 09:18:28
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/Colors.js" as COLORS;

// Component
AContent {

	id: oRoot;
	color: COLORS.mSaladDark();

	Text {

		id: oDemoText;
		color: COLORS.mWhiteLight();
		font.bold: true;
		font.pixelSize: 30;
		anchors.verticalCenter: oRoot.verticalCenter;
		anchors.horizontalCenter: oRoot.horizontalCenter;
	}

	Component.onCompleted: {

		onSgOrientationChanged(0);
	}

	function onSgOrientationChanged(inOrientation) {

		ALogger.mWriteToLog("AContentTablet onSgOrientationChanged");
		if (AGlobal.mIsLanscape()) {
			oDemoText.text = "Tablet Landscape UI";
			oRoot.color = COLORS.mSaladDark();
		} else {
			oDemoText.text = "Tablet Portrait UI";
			oRoot.color = COLORS.mPurpleDark();
		}
	}
}
