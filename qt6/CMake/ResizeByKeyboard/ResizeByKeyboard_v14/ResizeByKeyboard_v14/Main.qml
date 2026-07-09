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
import Arboreus;


// Application Main window
Window {

	id: oMainWindow;
	visible: true;
	flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;

	onWindowStateChanged: {

		console.log("onWindowStateChanged");
	}

	onScreenChanged: {

		console.log("onScreenChanged");
	}

	onActiveFocusItemChanged: {

		console.log("onActiveFocusItemChanged start");
		console.log("onActiveFocusItemChanged stop");
	}

	Rectangle {

		id: oWindowWrapper
		anchors.top: parent.top;
		anchors.topMargin: oMainWindow.SafeArea.margins.top;
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: oMainWindow.SafeArea.margins.bottom;
		anchors.left: parent.left;
		anchors.leftMargin: oMainWindow.SafeArea.margins.left;
		anchors.right: parent.right;
		anchors.rightMargin: oMainWindow.SafeArea.margins.right;
		color: "cyan";

		Rectangle {

			id: oContentWrapper;
			anchors.top: parent.top;
			anchors.bottom: parent.bottom;
			anchors.left: parent.left;
			anchors.right: parent.right;
			color: "green"

			Rectangle {

				id: oContent;
				anchors.fill: parent;
				color: "steelblue"

				Rectangle {

					id: oTextInputTopWrapper;
					color: "white";
					width: parent.width;
					height: parent.height / 5;
					anchors.top: parent.top;
					anchors.horizontalCenter: parent.horizontalCenter;

					ATextEdit {

						id: oTextInputTop;
						text: "TextInputTop";
						anchors.fill: parent;

						onActiveFocusChanged: {

							console.log("oTextInputTop onActiveFocusChanged start");
							console.log("oTextInputTop onActiveFocusChanged stop");
						}
					}
				}

				Rectangle {

					id: oTextInputCenterWrapper;
					color: "white";
					width: 150;
					height: 30;
					anchors.verticalCenter: parent.verticalCenter;
					anchors.horizontalCenter: parent.horizontalCenter;

					ATextInput {

						id: oTextInputCenter;
						text: "TextInputCenter";
						anchors.fill: parent;

						onActiveFocusChanged: {

							console.log("oTextInputCenter onActiveFocusChanged start");
							console.log("oTextInputCenter onActiveFocusChanged stop");
						}
					}
				}

				Rectangle {

					id: oTextInputBottomWrapper;
					color: "white";
					width: 150;
					height: 30;
					anchors.bottom: parent.bottom;
					anchors.horizontalCenter: parent.horizontalCenter;

					ATextInput {

						id: oTextInputBottom;
						text: "TextInputBottom";
						anchors.fill: parent;

						onActiveFocusChanged: {

							console.log("oTextInputBottom onActiveFocusChanged start");
							console.log("oTextInputBottom onActiveFocusChanged stop");
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

	Connections {

		target: Qt.inputMethod;
		function onKeyboardRectangleChanged() {

			console.log("onKeyboardRectangleChanged start");
			oTimerResize.restart();
			console.log("onKeyboardRectangleChanged stop");
		}
	}

	Timer {

		id: oTimerResize;
		interval: 150;
		repeat: false;
		running: false;

		onTriggered: {

			console.log("oTimerResize onTriggered start");

			var oVisible = Qt.inputMethod.visible;
			if (Qt.platform.os === "ios") {
				oMainWindow.mResizeIOS(oVisible);
			} else if (Qt.platform.os === "android") {
				oMainWindow.mResizeAndroid(oVisible);
			} else {
				console.log("Not mobile platform");
			}

			console.log("oTimerResize onTriggered stop");
		}
	}

	function mResizeIOS(inVisible) {

		console.log("mResizeIOS");

		if (inVisible) {

			console.log("Keyboard visible");

			oWindowWrapper.anchors.bottomMargin = AKeyboard.mHeight();
			oWindowWrapper.anchors.topMargin = oMainWindow.SafeArea.margins.top;

		} else {

			console.log("Keyboard hidden");

			oWindowWrapper.anchors.bottomMargin = oMainWindow.SafeArea.margins.bottom;
			oWindowWrapper.anchors.topMargin = oMainWindow.SafeArea.margins.top;
		}
	}

	function mResizeAndroid(inVisible) {

		console.log("mResizeAndroid");

		var oOffsetY = Qt.inputMethod.keyboardRectangle.y / Screen.devicePixelRatio;
		if (inVisible && oOffsetY > 0) {

			console.log("Keyboard visible");

			oWindowWrapper.anchors.bottomMargin = AKeyboard.mHeight();
			oWindowWrapper.anchors.topMargin = oMainWindow.SafeArea.margins.top;

		} else {

			console.log("Keyboard hidden");

			oWindowWrapper.anchors.bottomMargin = oMainWindow.SafeArea.margins.bottom;
			oWindowWrapper.anchors.topMargin = oMainWindow.SafeArea.margins.top;
		}
	}
}