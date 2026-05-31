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
	title: "Resize by keyboard v3";

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

	Rectangle {

		id: oContentWrapper;
		color: "lightgrey"
		anchors.fill: parent;

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