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
import QtQuick.Layouts;

// Application Main window
Window {

	property bool pBottomInput: false;

	id: oMainWindow;
	visible: true;
	flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;

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

					color: "white";
					width: 150;
					height: 30;
					anchors.top: parent.top;
					anchors.horizontalCenter: parent.horizontalCenter;

					TextInput {

						id: oTextInputTop;
						text: "Keyboard";
						anchors.fill: parent;

						onActiveFocusChanged: {

							console.log("oTextInputTop onActiveFocusChanged start");
							if (activeFocus) {
								oMainWindow.pBottomInput = false;
							} else {
								oMainWindow.pBottomInput = false;
							}
							console.log("oTextInputTop onActiveFocusChanged stop");
						}

						MouseArea {

							anchors.fill: parent;
							propagateComposedEvents: true;
							onClicked: {
								Qt.callLater(function() {
									console.log("oTextInputTop callLater start");
									oTextInputTop.forceActiveFocus()
									console.log("oTextInputTop callLater stop");
								})
							}
						}
					}
				}

				Rectangle {

					color: "white";
					width: 150;
					height: 30;
					anchors.verticalCenter: parent.verticalCenter;
					anchors.horizontalCenter: parent.horizontalCenter;

					TextInput {

						id: oTextInputCenter;
						text: "Keyboard";
						anchors.fill: parent;

						onActiveFocusChanged: {

							console.log("oTextInputCenter onActiveFocusChanged start");
							if (activeFocus) {
								oMainWindow.pBottomInput = false;
							} else {
								oMainWindow.pBottomInput = false;
							}
							console.log("oTextInputCenter onActiveFocusChanged stop");
						}

						MouseArea {

							anchors.fill: parent;
							propagateComposedEvents: true;
							onClicked: {
								Qt.callLater(function() {
									console.log("oTextInputCenter callLater start");
									oTextInputCenter.forceActiveFocus();
									console.log("oTextInputCenter callLater stop");
								})
							}
						}
					}
				}

				Rectangle {

					color: "white";
					width: 150;
					height: 30;
					anchors.bottom: parent.bottom;
					anchors.horizontalCenter: parent.horizontalCenter;

					TextInput {

						id: oTextInputBottom;
						text: "Keyboard";
						anchors.fill: parent;

						onActiveFocusChanged: {

							console.log("oTextInputBottom onActiveFocusChanged start");
							if (activeFocus) {
								oMainWindow.pBottomInput = true;
							} else {
								oMainWindow.pBottomInput = false;
							}
							console.log("oTextInputBottom onActiveFocusChanged stop");
						}

						MouseArea {

							anchors.fill: parent;
							propagateComposedEvents: true;
							onClicked: {
								Qt.callLater(function() {
									console.log("oTextInputBottom callLater start");
									oTextInputBottom.forceActiveFocus();
									console.log("oTextInputBottom callLater stop");
								})
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
		interval: 250;
		repeat: false;
		running: false;

		onTriggered: {

			console.log("oTimerResize onTriggered start");

			var oKeyboardRectangle = Qt.inputMethod.keyboardRectangle;
			var oVisible = Qt.inputMethod.visible;
			var oOffsetY = oKeyboardRectangle.y / Screen.devicePixelRatio;

			oMainWindow.mResizeDefault();

			if (Qt.platform.os === "ios") {
				oMainWindow.mResizeIOS(oKeyboardRectangle,oVisible,oOffsetY);
			} else if (Qt.platform.os === "android") {
				oMainWindow.mResizeAndroid(oKeyboardRectangle,oVisible,oOffsetY);
			} else {
				console.log("Not mobile platform");
			}

			console.log("oTimerResize onTriggered stop");
		}
	}

	function mResizeIOS(inKeyboardRectangle,inVisible,inOffsetY) {

		console.log("mResizeIOS");

		if (inVisible && inOffsetY > 0) {
			console.log("Keyboard visible");
			if (oMainWindow.pBottomInput) {
				console.log("Input at the bottom");
				var oTopMargin = inKeyboardRectangle.height + oMainWindow.SafeArea.margins.top
				if (oWindowWrapper.anchors.topMargin !== oTopMargin) {
					oWindowWrapper.anchors.topMargin = oTopMargin;
				}
				oWindowWrapper.anchors.bottomMargin = 0;
			} else {
				console.log("Input is regular");
				oWindowWrapper.anchors.bottomMargin = inKeyboardRectangle.height;
				oWindowWrapper.anchors.topMargin = oMainWindow.SafeArea.margins.top;
			}
		} else {
			console.log("Keyboard hidden");
		}
	}

	function mResizeAndroid(inKeyboardRectangle,inVisible,inOffsetY) {

		console.log("mResizeAndroid");
		if (inVisible && inOffsetY > 0) {
			console.log("Keyboard visible");
			var oKeyboardHeight = inKeyboardRectangle.height / Screen.devicePixelRatio;
			if (oMainWindow.pBottomInput) {
				console.log("Input at the bottom");
				oWindowWrapper.anchors.topMargin = oKeyboardHeight + oMainWindow.SafeArea.margins.bottom;
			} else {
				console.log("Input is regular");
				oWindowWrapper.anchors.bottomMargin = oKeyboardHeight;
				oWindowWrapper.anchors.topMargin = oMainWindow.SafeArea.margins.top;
			}
		} else {
			console.log("Keyboard hidden");
		}
	}

	function mResizeDefault() {

		oWindowWrapper.anchors.topMargin = oMainWindow.SafeArea.margins.top;
		oWindowWrapper.anchors.bottomMargin = oMainWindow.SafeArea.margins.bottom;
		oWindowWrapper.anchors.leftMargin = oMainWindow.SafeArea.margins.left;
		oWindowWrapper.anchors.rightMargin = oMainWindow.SafeArea.margins.right;
	}
}