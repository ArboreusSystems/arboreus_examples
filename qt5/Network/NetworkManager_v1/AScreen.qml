// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/04/2021 at 17:13:52
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Window 2.12

// Application includes
import "qrc:/AColors.js" as COLORS;


// Component
Rectangle {

	function mUpdateSize() {

		var rectKeyboard = Qt.inputMethod.keyboardRectangle;
		var offsetY = rectKeyboard.y / Screen.devicePixelRatio;
		if (Qt.inputMethod.visible && offsetY > 0) {
			var height = Screen.height;
			var offsetBar = Screen.height - Screen.desktopAvailableHeight;
			if(Qt.platform.os == "android") {
				var kbHeight = rectKeyboard.height / Screen.devicePixelRatio + offsetBar;
				oRoot.height = height - kbHeight;
				var offset = Screen.height - offsetY - offsetBar;
				oTimerResize.offset = offset;
				oTimerResize.restart();
			} else {
				oRoot.height = height - rectKeyboard.height;
			}
		} else {
			oTimerResize.stop();
			oRoot.anchors.bottomMargin = 0;
			oRoot.height = parent && parent.height > 0 ? parent.height : Screen.height;
		}
	}

	id: oRoot;
	width: parent ? parent.width : Screen.width;
	height: parent ? parent.height : Screen.height;
	color: COLORS.mWhite();

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
}
