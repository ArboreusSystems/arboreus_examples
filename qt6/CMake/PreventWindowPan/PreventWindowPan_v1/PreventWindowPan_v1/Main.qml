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
					width: 150;
					height: 30;
					anchors.top: parent.top;
					anchors.horizontalCenter: parent.horizontalCenter;

					TextInput {

						id: oTextInputTop;
						text: "TextInputTop";
						anchors.fill: parent;

						onActiveFocusChanged: {

							console.log("oTextInputTop onActiveFocusChanged start");
							console.log("oTextInputTop onActiveFocusChanged stop");
						}

						AWindowPanHandler {

							id: oPanHandlerTop;
							mItem: oTextInputTop;
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

					TextInput {

						id: oTextInputCenter;
						text: "TextInputCenter";
						anchors.fill: parent;

						onActiveFocusChanged: {

							console.log("oTextInputCenter onActiveFocusChanged start");
							console.log("oTextInputCenter onActiveFocusChanged stop");
						}

						AWindowPanHandler {

							id: oPanHandlerCenter;
							mItem: oTextInputCenter;
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

					TextInput {

						id: oTextInputBottom;
						text: "TextInputBottom";
						anchors.fill: parent;

						onActiveFocusChanged: {

							console.log("oTextInputBottom onActiveFocusChanged start");
							console.log("oTextInputBottom onActiveFocusChanged stop");
						}

						AWindowPanHandler {

							id: oPanHandlerBottom;
							mItem: oTextInputBottom;
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

			console.log("oTimerResize onTriggered stop");
		}
	}
}