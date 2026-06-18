// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/06/2026 at 15:07:38
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Window;

// Application includes


// Component
Rectangle {

	property bool pBottomInput: false;

	id: oRoot;

	Component.onCompleted: {

		Qt.inputMethod.onKeyboardRectangleChanged.connect(mResize);
		Qt.inputMethod.onVisibleChanged.connect(mResize);

		mResize();
	}

	Component.onDestruction: {

		Qt.inputMethod.onKeyboardRectangleChanged.disconnect(mResize);
		Qt.inputMethod.onVisibleChanged.disconnect(mResize);
	}

	Timer {

		id: oTimerResize;
		interval: 150;
		repeat: false;
		running: false;

		onTriggered: {

			var oKeyboardRectangle = Qt.inputMethod.keyboardRectangle;
			var oVisible = Qt.inputMethod.visible;
			var oOffsetY = oKeyboardRectangle.y / Screen.devicePixelRatio;

			oContentWrapper.anchors.bottomMargin = oMainWindow.SafeArea.margins.bottom;
			oContentWrapper.anchors.topMargin = oMainWindow.SafeArea.margins.top;

			if (Qt.platform.os === "ios") {
				oRoot.mResizeIOS(oKeyboardRectangle,oVisible,oOffsetY);
			} else if (Qt.platform.os === "android") {
				oRoot.mResizeAndroid(oKeyboardRectangle,oVisible,oOffsetY);
			} else {
				console.log("Not mobile platform");
			}
		}
	}

	function mResize() {

		oTimerResize.restart();
	}

	function mResizeIOS(inKeyboardRectangle,inVisible,inOffsetY) {

		console.log("mResizeIOS");

		if (inVisible && inOffsetY > 0) {
			console.log("Keyboard visible");
			if (oRoot.pBottomInput) {
				console.log("Input at the bottom");
				oContentWrapper.anchors.bottomMargin = 0;
				oContentWrapper.anchors.topMargin = inKeyboardRectangle.height + oMainWindow.SafeArea.margins.top;
			} else {
				console.log("Input is regular");
				oContentWrapper.anchors.bottomMargin = inKeyboardRectangle.height;
				oContentWrapper.anchors.topMargin = oMainWindow.SafeArea.margins.top;
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
			if (oRoot.pBottomInput) {
				console.log("Input at the bottom");
				oContentWrapper.anchors.topMargin = oKeyboardHeight + oMainWindow.SafeArea.margins.bottom;
			} else {
				console.log("Input is regular");
				oContentWrapper.anchors.bottomMargin = oKeyboardHeight;
				oContentWrapper.anchors.topMargin = oMainWindow.SafeArea.margins.top;
			}
		} else {
			console.log("Keyboard hidden");
		}
	}
}
