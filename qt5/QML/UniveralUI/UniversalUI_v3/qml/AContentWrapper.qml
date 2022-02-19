// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/10/2020 at 18:12:10
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Window 2.15

// Application includes


// Component
Rectangle {

	id: oRoot

	Component.onCompleted: {

		Qt.inputMethod.onKeyboardRectangleChanged.connect(mUpdateSize);
		Qt.inputMethod.onVisibleChanged.connect(mUpdateSize);

		mUpdateSize();
	}

	Component.onDestruction: {

		Qt.inputMethod.onKeyboardRectangleChanged.disconnect(mUpdateSize);
		Qt.inputMethod.onVisibleChanged.disconnect(mUpdateSize);
	}

	Timer {

		property real offset: 0;

		id: oTimerResize;
		interval: 100;
		repeat: false;
		running: false;
		onTriggered: {

			oRoot.anchors.bottomMargin = offset;
			oTimerResize.stop();
		}
	}

	Connections {

		target: AGlobal;
		function onSgOrientationChanged(inOrientation) {

			Qt.inputMethod.hide();
			oRoot.anchors.bottomMargin = 0;
			oTimerResize.restart();
			oTimerResize.stop();
		}
	}

	function mUpdateSize() {

		var oDeviceSafeArea = AGlobal.mDeviceSafeArea();
		var oSafeAreaHeightOffset = oDeviceSafeArea.pTop + oDeviceSafeArea.pBottom;
		var oRectKeyboard = Qt.inputMethod.keyboardRectangle;
		var oOffsetY = oRectKeyboard.y / Screen.devicePixelRatio;

		if (Qt.inputMethod.visible && oOffsetY > 0) {
			var height = Screen.height;
			var offsetBar = height - Screen.desktopAvailableHeight - oDeviceSafeArea.pTop;
			if(Qt.platform.os == "android") {
				oTimerResize.offset = height - oOffsetY - offsetBar;
				oTimerResize.restart();
			} else {
				oRoot.anchors.bottomMargin = oRectKeyboard.height - oDeviceSafeArea.pBottom;
			}
		} else {
			oTimerResize.stop();
			oRoot.anchors.bottomMargin = 0;
		}
	}
}
