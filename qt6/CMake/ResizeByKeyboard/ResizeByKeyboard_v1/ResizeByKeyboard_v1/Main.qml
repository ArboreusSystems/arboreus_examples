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
import QtQuick 6.8;
import QtQuick.Controls 6.8;


// Application Main window
Window {

	id: rootWindow
	visible: true
	width: 480
	height: 800

	Item {

		id: mainContent

		Component.onCompleted: {

			mainContent.mSetSize();
		}

		Timer {

			property real pOffset: 0;

			id: oTimerResize;
			interval: 100;
			repeat: false;
			running: false;
			onTriggered: {

				mainContent.height = rootWindow.height - oTimerResize.pOffset;
				mainContent.anchors.bottomMargin = oTimerResize.pOffset;
				oTimerResize.stop();
			}
		}

		Connections {

			target: Qt.inputMethod;
			function onKeyboardRectangleChanged() {

				mainContent.mSetSize();
			}
		}

		function mSetSize() {

			let oPlatform = Qt.platform.os;
			if (oPlatform === "android") {
				console.debug("Plaform '" + oPlatform + "' is mobile");
				mainContent.mSetSizeAndroid();
			} else if (oPlatform === "ios"){
				console.debug("Plaform '" + oPlatform + "' is mobile");
				mainContent.mSetSizeUniversal();
			} else {
				mainContent.mSetSizeUniversal();
				console.debug("Plaform '" + oPlatform + "' isn't mobile");
			}
		}

		function mSetSizeUniversal() {

			mainContent.anchors.top = mainContent.parent.top;
			mainContent.anchors.left = mainContent.parent.left;
			mainContent.anchors.right = mainContent.parent.right;
			mainContent.anchors.bottom = Qt.inputMethod.visible ? mainContent.parent.bottom : mainContent.parent.bottom;
			mainContent.anchors.bottomMargin = Qt.inputMethod.visible ? Qt.inputMethod.keyboardRectangle.height : 0;
		}

		function mSetSizeAndroid() {

			let oRectKeyboard = Qt.inputMethod.keyboardRectangle;
			let oOffsetY = oRectKeyboard.y / Screen.devicePixelRatio;

			if (Qt.inputMethod.visible && oOffsetY > 0) {
				let oHeight = Screen.height;
				let oOffsetBar = oHeight - Screen.desktopAvailableHeight;
				oTimerResize.pOffset = oHeight - oOffsetY - oOffsetBar;
				oTimerResize.restart();
			} else {
				mainContent.mSetSizeUniversal();
				oTimerResize.stop();
			}
		}

		Rectangle {

			color: "blue";
			width: parent.width - 50;
			height: 40;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.horizontalCenter: parent.horizontalCenter;

			TextInput {

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
