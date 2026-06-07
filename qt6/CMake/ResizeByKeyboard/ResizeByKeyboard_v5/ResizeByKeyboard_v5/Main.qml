// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/05/2026 at 10:30:08
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Window;


// Application Main window
Window {

	id: oMainWindow;
	visible: true;
	title: "Resize by keyboard v4";
	width: maximumWidth;
	height: maximumHeight;
	flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;

	readonly property real pInsetTop: SafeArea.margins.top;
	readonly property real pInsetBottom: SafeArea.margins.bottom;
	readonly property real pInsetLeft: SafeArea.margins.left;
	readonly property real pInsetRight: SafeArea.margins.right;

	Rectangle {

		id: oBarLeft;
		color: "grey";
		width: oMainWindow.pInsetLeft;
		anchors.top: parent.top;
		anchors.bottom: parent.bottom;
		anchors.left: parent.left;
	}

	Rectangle {

		id: oBarRight;
		color: "grey";
		width: oMainWindow.pInsetRight;
		anchors.top: parent.top;
		anchors.bottom: parent.bottom;
		anchors.right: parent.right;
	}

	Rectangle {

		id: oBarTop;
		color: "orange";
		height: oMainWindow.pInsetTop;
		anchors.top: parent.top;
		anchors.left: oBarLeft.right;
		anchors.right: oBarRight.left;
	}

	Rectangle {

		id: oBarBottom;
		color: "blue";
		height: oMainWindow.pInsetBottom;
		anchors.bottom: parent.bottom;
		anchors.left: oBarLeft.right;
		anchors.right: oBarRight.left;
	}

	Rectangle {

		id: oContentWrapper;
		color: "white";
		anchors.top: oBarTop.bottom;
		anchors.left: oBarLeft.right;
		anchors.right: oBarRight.left;
		anchors.bottom: oBarBottom.top;

		readonly property bool pIsKeyboardVisible: Qt.inputMethod.visible;
		property bool pIsBottom: false;

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
					oBarTop.height = oMainWindow.pInsetTop + inKeyboardrectangle.height;
				} else {
					oContentWrapper.anchors.bottomMargin = inKeyboardrectangle.height;
				}
			} else {
				console.log("Keyboard is off");
				oBarBottom.height = oMainWindow.pInsetBottom;
				oBarTop.height = oMainWindow.pInsetTop;
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
					oBarTop.height = oMainWindow.pInsetTop + oKeyboardHeight - oMainWindow.pInsetBottom;
				} else {
					oContentWrapper.anchors.bottomMargin = oKeyboardHeight;
				}
			} else {
				console.log("Keyboard is off");
				oBarTop.height = oMainWindow.pInsetTop;
				oContentWrapper.anchors.bottomMargin = 0;
			}
		}

		function mLogDetails(inKeyboardrectangle) {

			console.log("----------");
			console.log("oMainWindow");
			console.log("oMainWindow heigh: " + oMainWindow.height + " width: " + oMainWindow.width);
			console.log("oMainWindow pInsetTop: " + oMainWindow.pInsetTop + " pInsetBottom: " + oMainWindow.pInsetBottom);
			console.log("oMainWindow pInsetLeft: " + oMainWindow.pInsetLeft + " pInsetRight: " + oMainWindow.pInsetRight);

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

		Rectangle {

			id: oContent;
			color: "honeydew";
			anchors.bottom: parent.bottom;
			anchors.left: parent.left;
			anchors.right: parent.right;
			height: parent.height;

			Rectangle {

				id: oInputTopWrapper;
				color: "steelblue";
				width: parent.width - 50;
				height: 40;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.top: parent.top;

				TextInput {

					id: oInputTop;
					objectName: "InputTop";
					width: parent.width - 50;
					color: "white";
					height: 40;
					anchors.fill: parent;

					onActiveFocusChanged: {

						if (activeFocus) {
							console.log("----------");
							console.log("---> oInputTop focus active");
						} else {
							console.log("----------");
							console.log("---> oInputTop focus inactive");
						}
					}
				}
			}

			Rectangle {

				id: oInputCenterWrapper;
				color: "green";
				width: parent.width - 50;
				height: 40;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.verticalCenter: parent.verticalCenter;

				TextInput {

					id: oInputCenter;
					width: parent.width - 50;
					color: "white";
					height: 40;
					anchors.fill: parent;

					onActiveFocusChanged: {

						if (activeFocus) {
							console.log("----------");
							console.log("---> oInputCenter focus active");
						} else {
							console.log("----------");
							console.log("---> oInputCenter focus inactive");
						}
					}
				}
			}

			Rectangle {

				id: oInputBottomWrapper;
				color: "purple";
				width: parent.width - 50;
				height: 40;
				anchors.bottom: parent.bottom;
				anchors.horizontalCenter: parent.horizontalCenter;

				TextInput {

					id: oInputBottom;
					width: parent.width - 50;
					color: "white";
					height: 40;
					anchors.fill: parent;

					onActiveFocusChanged: {

						if (activeFocus) {
							console.log("----------");
							console.log("---> oInputBottom focus active");
							oContentWrapper.pIsBottom = true;

						} else {
							console.log("----------");
							console.log("---> oInputBottom focus inactive");
							oContentWrapper.pIsBottom = false;
						}
					}
				}
			}

			Rectangle {

				id: oSignTopLeft;
				width: 10;
				height: 10;
				color: "magenta";
				anchors.top: parent.top;
				anchors.left: parent.left;
			}

			Rectangle {

				id: oSignTopRight;
				width: 10;
				height: 10;
				color: "magenta";
				anchors.top: parent.top;
				anchors.right: parent.right;
			}

			Rectangle {

				id: oSignBottomLeft;
				width: 10;
				height: 10;
				color: "magenta";
				anchors.bottom: parent.bottom;
				anchors.left: parent.left;
			}

			Rectangle {

				id: oSignBottomRight;
				width: 10;
				height: 10;
				color: "magenta";
				anchors.bottom: parent.bottom;
				anchors.right: parent.right;
			}
		}
	}
}
