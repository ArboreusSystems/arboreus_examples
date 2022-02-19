// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/09/2020 at 09:17:46
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
	color: COLORS.mPurple();

	Rectangle {

		id: oContentFrame;
		width: parent.width;
		height: parent.height;
		anchors.fill: parent;

		ATextInput {

			id: oTestTextInput;
			width: 150;
			height: 50;
			anchors.horizontalCenter: oContentFrame.horizontalCenter;
			anchors.verticalCenter: oContentFrame.verticalCenter;
		}

		Text {

			id: oDemoText;
			color: COLORS.mWhiteLight();
			font.bold: true;
			font.pixelSize: 20;
			anchors.horizontalCenter: oContentFrame.horizontalCenter;
			anchors.bottom: oTestTextInput.top;
			anchors.bottomMargin: 20;
		}

		Rectangle {

			id: oLeftTopSign;
			color: COLORS.mRed();
			width: 20;
			height: 20;
			anchors.top: parent.top;
			anchors.left: parent.left;
		}

		Rectangle {

			id: oRightTopSign;
			color: COLORS.mRed();
			width: 20;
			height: 20;
			anchors.top: parent.top;
			anchors.right: parent.right;
		}

		Rectangle {

			id: oLeftBottomSign;
			color: COLORS.mRed();
			width: 20;
			height: 20;
			anchors.bottom: parent.bottom;
			anchors.left: parent.left;
		}

		Rectangle {

			id: oRightBottomSign;
			color: COLORS.mRed();
			width: 20;
			height: 20;
			anchors.bottom: parent.bottom;
			anchors.right: parent.right;
		}
	}

	Component.onCompleted: {

		onSgOrientationChanged(0);
	}

	function onSgOrientationChanged(inOrientation) {

		ALogger.mWriteToLog("AContentPhone onSgOrientationChanged");
		if (AGlobal.mIsLanscape()) {
			oDemoText.text = "Phone Landscape UI";
			oContentFrame.color = COLORS.mSaladDark();
		} else {
			oDemoText.text = "Phone Portrait UI";
			oContentFrame.color = COLORS.mPurpleDark();
		}
	}
}
