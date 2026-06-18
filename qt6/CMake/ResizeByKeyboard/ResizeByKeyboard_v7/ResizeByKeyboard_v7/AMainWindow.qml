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

		states: [

			State {

				name: "IOSDefault";

				PropertyChanges {

					target: oBarBottom;
					height: oRoot.pInsetBottom;
				}

				PropertyChanges {

					target: oBarTop;
					height: oRoot.pInsetTop;
				}

				PropertyChanges {

					target: oContentWrapper;
					anchors.bottomMargin: 0;
				}
			},

			State {

				name: "IOSKeyboardBottom";

				PropertyChanges {

					target: oBarBottom;
					height: 0;
				}

				PropertyChanges {

					target: oBarTop;
					height: oRoot.pInsetTop + Qt.inputMethod.keyboardRectangle.height;
				}

				PropertyChanges {

					target: oContentWrapper;
					anchors.bottomMargin: 0;
				}
			},

			State {

				name: "IOSKeyboardTop";

				PropertyChanges {

					target: oBarBottom;
					height: 0;
				}

				PropertyChanges {

					target: oBarTop;
					height: oRoot.pInsetTop !== oBarTop.height ? oBarTop.height : oRoot.pInsetTop;
				}

				PropertyChanges {

					target: oContentWrapper;
					anchors.bottomMargin: Qt.inputMethod.keyboardRectangle.height;
				}
			}
		]

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
			}
		}

		Connections {

			target: ADevice;
			function onSgKeyboardRectangleChanged() {

				oTimerKeyboardResize.restart();
			}
		}

		function mResizeIOS(inKeyboardrectangle) {

			console.log("----------");
			console.log("Platform: iOS");
			console.log("pIsKeyboardVisible: " + oContentWrapper.pIsKeyboardVisible);

			if (oContentWrapper.pIsKeyboardVisible) {
				console.log("Keyboard is on");
				// oBarBottom.height = 0;
				oContentWrapper.state = "IOSDefault";
				if (oContentWrapper.pIsBottom) {
					oContentWrapper.state = "IOSKeyboardBottom";
					// oBarTop.height = oRoot.pInsetTop + inKeyboardrectangle.height;
				} else {
					oContentWrapper.state = "IOSKeyboardTop";
					// oContentWrapper.anchors.bottomMargin = inKeyboardrectangle.height;
				}
			} else {
				console.log("Keyboard is off");
				oContentWrapper.state = "IOSDefault";
				// oBarBottom.height = oRoot.pInsetBottom;
				// oBarTop.height = oRoot.pInsetTop;
				// oContentWrapper.anchors.bottomMargin = 0;
			}

			console.log("oBarTop.height: " + oBarTop.height);
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

		AContent {

			id: oContent;
			color: "honeydew";
		}
	}
}
