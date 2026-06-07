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
ApplicationWindow {

	id: oMainWindow;
	visible: true;
	title: "Resize by keyboard v4";
	width: maximumWidth;
	height: maximumHeight;

	readonly property real pInsetTop: SafeArea.margins.top;
	readonly property real pInsetBottom: SafeArea.margins.bottom;
	readonly property real pInsetLeft: SafeArea.margins.left;
	readonly property real pInsetRight: SafeArea.margins.right;

	background: Rectangle {

		id: oBackground;
		anchors.fill: parent;
		color: "cyan";
	}

	header: Rectangle {

		id: oHeader;
		color: "orange";
		height: oMainWindow.pInsetTop;
	}

	footer: Rectangle {

		id: oFooter;
		color: "blue";
		height: oMainWindow.pInsetBottom;
	}

	Timer {

		id: oKeyboardTimer;
		interval: 150;
		repeat: false;
		onTriggered: {

			var oKeyboardRectangle = Qt.inputMethod.keyboardRectangle;
			var oVisible = Qt.inputMethod.visible;

			oContentWrapper.mLogDetails(oKeyboardRectangle,oVisible);

			if (Qt.platform.os === "android") {
				oContentWrapper.mResizeAndroid(oKeyboardRectangle,oVisible);
			} else if (Qt.platform.os === "ios") {
				oContentWrapper.mResizeIOS(oKeyboardRectangle,oVisible);
			} else {
				console.log("Platform isn't mobile");
			}
		}
	}

	Rectangle {

		id: oContentWrapper;
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.right: parent.right;
		height: oMainWindow.contentItem.height;

		Connections {

			target: Qt.inputMethod;
			function onKeyboardRectangleChanged() {

				oKeyboardTimer.restart();
			}
		}

		function mResizeIOS(inKeyboardrectangle,inVisible) {

			console.log("Platform: iOS");
			console.log("Qt.inputMethod.visible: " + inVisible);

			if (inVisible) {
				console.log("Keyboard is on");
			} else {
				console.log("Keyboard is off");
			}
		}

		function mResizeAndroid(inKeyboardrectangle,inVisible) {

			console.log("Platform: Android");
			console.log("Qt.inputMethod.visible: " + inVisible);

			if (inVisible) {
				console.log("Keyboard is on");
			} else {
				console.log("Keyboard is off");
			}
		}

		function mLogDetails(inKeyboardrectangle,inVisible) {

			console.log("oMainWindow");
			console.log("oMainWindow heigh: " + oMainWindow.height + " width: " + oMainWindow.width);

			console.log("oContentWrapper");
			console.log("oContentWrapper heigh: " + oContentWrapper.height + " width: " + oContentWrapper.width);

			console.log("oContent");
			console.log("oContent heigh: " + oContent.height + " width: " + oContent.width);

			console.log("Keyboard");
			console.log("Keyboard heigh: " + inKeyboardrectangle.height + " width: " + inKeyboardrectangle.width);
		}

		Rectangle {

			id: oContent;
			anchors.fill: parent;
			anchors.bottomMargin: 0;

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
				}
			}

			Rectangle {

				width: 10;
				height: 10;
				color: "Magenta";
				anchors.top: parent.top;
				anchors.left: parent.left;
			}

			Rectangle {

				width: 10;
				height: 10;
				color: "Magenta";
				anchors.top: parent.top;
				anchors.right: parent.right;
			}

			Rectangle {

				width: 10;
				height: 10;
				color: "Magenta";
				anchors.bottom: parent.bottom;
				anchors.left: parent.left;
			}

			Rectangle {

				width: 10;
				height: 10;
				color: "Magenta";
				anchors.bottom: parent.bottom;
				anchors.right: parent.right;
			}
		}
	}
}
