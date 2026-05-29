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
import QtQuick
import QtQuick.Controls
import QtQuick.Window


// Application window
Window {

	id: oRoot;
	visible: true;
	flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;

	readonly property real pInsetTop: SafeArea.margins.top;
	readonly property real pInsetBottom: SafeArea.margins.bottom;
	readonly property real pInsetLeft: SafeArea.margins.left;
	readonly property real pInsetRight: SafeArea.margins.right;

	Rectangle {

		id: oBarTop;
		anchors.top: parent.top;
		width: parent.width;
		height: oRoot.pInsetTop;
		color: "blue";
	}

	Rectangle {

		id: oBarBottom;
		anchors.bottom: parent.bottom;
		width: parent.width;
		height: oRoot.pInsetBottom;
		color: "red";
	}

	Rectangle {

		id: oBarLeft;
		anchors.left: parent.left;
		width: oRoot.pInsetLeft;
		height: parent.height;
		color: "green";
	}

	Rectangle {

		id: oBarRight;
		anchors.right: parent.right;
		width: oRoot.pInsetRight;
		height: parent.height;
		color: "magenta";
	}
}
