// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/06/2026 at 14:24:04
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Window;

// Application includes


// Component
Window {

	readonly property real pInsetTop: SafeArea.margins.top;
	readonly property real pInsetBottom: SafeArea.margins.bottom;
	readonly property real pInsetLeft: SafeArea.margins.left;
	readonly property real pInsetRight: SafeArea.margins.right;

	property alias pContent: oContent;
	property alias pContentWrapper: oContentWrapper;

	signal sgKeyboardVisible(bool inVisibile);

	id: oRoot;
	visible: true;
	width: maximumWidth;
	height: maximumHeight;
	flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;
	color: "cyan";

	Rectangle {

		id: oBarLeft;
		color: "grey";
		width: oRoot.pInsetLeft;
		anchors.top: parent.top;
		anchors.bottom: parent.bottom;
		anchors.left: parent.left;
	}

	Rectangle {

		id: oBarRight;
		color: "grey";
		width: oRoot.pInsetRight;
		anchors.top: parent.top;
		anchors.bottom: parent.bottom;
		anchors.right: parent.right;
	}

	Rectangle {

		id: oBarTop;
		color: "orange";
		height: oRoot.pInsetTop;
		anchors.top: parent.top;
		anchors.left: oBarLeft.right;
		anchors.right: oBarRight.left;
	}

	Rectangle {

		id: oBarBottom;
		color: "blue";
		height: oRoot.pInsetBottom;
		anchors.bottom: parent.bottom;
		anchors.left: oBarLeft.right;
		anchors.right: oBarRight.left;
	}

	AContentWrapper {

		id: oContentWrapper;
		anchors.top: oBarTop.bottom;
		anchors.left: oBarLeft.right;
		anchors.right: oBarRight.left;
		anchors.bottom: oBarBottom.top;

		Timer {

			id: oTimerKeyboardResize;
			interval: 150;
			repeat: false;
			onTriggered: {

				var oKeyboardRectangle = Qt.inputMethod.keyboardRectangle;

				if (Qt.platform.os === "android") {
					oContentWrapper.mResizeAndroid(oKeyboardRectangle);
				} else if (Qt.platform.os === "ios") {
					oContentWrapper.mResizeIOS(oKeyboardRectangle);
				} else {
					console.log("Platform isn't mobile");
				}

				oContentWrapper.mLogDetails(oKeyboardRectangle);
			}
		}

		Connections {

			target: Qt.inputMethod;
			function onKeyboardRectangleChanged() {

				oTimerKeyboardResize.restart();
			}
		}

		function mResizeIOS(inKeyboardrectangle) {

			console.log("----------");
			console.log("Platform: iOS");
			console.log("pIsKeyboardVisible: " + oContentWrapper.pIsKeyboardVisible);

			if (oContentWrapper.pIsKeyboardVisible) {
				console.log("Keyboard is on");
				oBarBottom.height = 0;
				if (oContentWrapper.pIsBottom) {
					oBarTop.height = oRoot.pInsetTop + inKeyboardrectangle.height;
				} else {
					oContentWrapper.anchors.bottomMargin = inKeyboardrectangle.height;
				}
			} else {
				console.log("Keyboard is off");
				oBarBottom.height = oRoot.pInsetBottom;
				oBarTop.height = oRoot.pInsetTop;
				oContentWrapper.anchors.bottomMargin = 0;
			}
		}

		function mResizeAndroid(inKeyboardrectangle) {

			console.log("----------");
			console.log("Platform: Android");
			console.log("pIsKeyboardVisible: " + oContentWrapper.pIsKeyboardVisible);

			var oKeyboardHeight = inKeyboardrectangle.height / Screen.devicePixelRatio;

			if (oContentWrapper.pIsKeyboardVisible) {
				console.log("Keyboard is on");
				if (oContentWrapper.pIsBottom) {
					oBarTop.height = oRoot.pInsetTop + oKeyboardHeight - oRoot.pInsetBottom;
				} else {
					oContentWrapper.anchors.bottomMargin = oKeyboardHeight - oRoot.pInsetBottom;
				}
			} else {
				console.log("Keyboard is off");
				oBarTop.height = oRoot.pInsetTop;
				oContentWrapper.anchors.bottomMargin = 0;
			}
		}

		function mLogDetails(inKeyboardrectangle) {

			console.log("----------");
			console.log("oMainWindow");
			console.log("oMainWindow heigh: " + oRoot.height + " width: " + oRoot.width);
			console.log("oMainWindow pInsetTop: " + oRoot.pInsetTop + " pInsetBottom: " + oRoot.pInsetBottom);
			console.log("oMainWindow pInsetLeft: " + oRoot.pInsetLeft + " pInsetRight: " + oRoot.pInsetRight);

			console.log("----------");
			console.log("oContentWrapper");
			console.log("oContentWrapper heigh: " + oContentWrapper.height + " width: " + oContentWrapper.width);
			console.log("oContentWrapper pIsBottom: " + oContentWrapper.pIsBottom);

			console.log("----------");
			console.log("oContent");
			console.log("oContent heigh: " + oContent.height + " width: " + oContent.width);

			console.log("----------");
			console.log("Keyboard");
			console.log("Keyboard heigh: " + inKeyboardrectangle.height + " width: " + inKeyboardrectangle.width);

			console.log("----------");
			console.log("Screen");
			console.log("Screen height: " + Screen.height + " desktopAvailableHeight: " + Screen.desktopAvailableHeight);
		}

		AContent {

			id: oContent;
			color: "honeydew";
		}
	}
}
