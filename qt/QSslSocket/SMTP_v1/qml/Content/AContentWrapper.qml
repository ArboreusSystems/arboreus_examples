// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/01/2022 at 16:52:36
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Window 2.15

// Application includes


// Component
Rectangle {

	signal sgKeyboardVisible(bool inVisible);

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

		property real pOffset: 0;

		id: oTimerResize;
		interval: 100;
		repeat: false;
		running: false;
		onTriggered: {

			oRoot.anchors.bottomMargin = oTimerResize.pOffset;
			oTimerResize.stop();
		}
	}

	function mUpdateSize() {

		let oRectKeyboard = Qt.inputMethod.keyboardRectangle;
		let oOffsetY = oRectKeyboard.y / Screen.devicePixelRatio;

		if (Qt.inputMethod.visible && oOffsetY > 0) {
			let oHeight = Screen.height;
			let oOffsetBar = oHeight - Screen.desktopAvailableHeight;
			if(Qt.platform.os == "android") {
				oTimerResize.pOffset = oHeight - oOffsetY - oOffsetBar;
				oTimerResize.restart();
			} else {
				oRoot.anchors.bottomMargin = oRectKeyboard.height;
			}
			oRoot.sgKeyboardVisible(true);
		} else {
			oTimerResize.stop();
			oRoot.anchors.bottomMargin = 0;
			oRoot.sgKeyboardVisible(false);
		}
	}
}

