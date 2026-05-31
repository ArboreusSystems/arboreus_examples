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

	Rectangle {

		id: oContentWrapper;
		color: "lightgrey"
		anchors.fill: parent;

		Rectangle {

			id: oInputTopWrapper;
			color: "steelblue";
			width: parent.width - 50;
			height: 40;
			anchors.horizontalCenter: parent.horizontalCenter;

			Component.onCompleted: {

				oInputTopWrapper.state = "inactive";
			}

			states: [

				State {

					name: "active";

					AnchorChanges {

						target: oInputTopWrapper;
						anchors.top: undefined;
						anchors.bottom: oContentWrapper.bottom;
					}
				},

				State {

					name: "inactive";

					PropertyChanges {

						target: oInputTopWrapper;
						anchors.top: oContentWrapper.top;
						anchors.bottom: undefined;
					}
				}
			]

			TextInput {

				id: oInputTop;
				objectName: "InputTop";
				width: parent.width - 50;
				color: "white";
				height: 40;
				anchors.fill: parent;

				onActiveFocusChanged: {

					if (activeFocus) {
						oInputCenterWrapper.visible = false;
						oInputBottomWrapper.visible = false;
						oInputTopWrapper.state = "active";
					} else {
						oInputCenterWrapper.visible = true;
						oInputBottomWrapper.visible = true;
						oInputTopWrapper.state = "inactive";
					}
				}
			}
		}

		Rectangle {

			id: oInputCenterWrapper;
			color: "green";
			width: parent.width - 50;
			height: 40;
			anchors.horizontalCenter: parent.horizontalCenter;

			Component.onCompleted: {

				oInputCenterWrapper.state = "inactive";
			}

			states: [

				State {

					name: "active";

					AnchorChanges {

						target: oInputCenterWrapper;
						anchors.verticalCenter: undefined;
						anchors.bottom: oContentWrapper.bottom;
					}
				},

				State {

					name: "inactive";

					PropertyChanges {

						target: oInputCenterWrapper;
						anchors.verticalCenter: oContentWrapper.verticalCenter;
						anchors.bottom: undefined;
					}
				}
			]

			TextInput {

				id: oInputCenter;
				width: parent.width - 50;
				color: "white";
				height: 40;
				anchors.fill: parent;

				onActiveFocusChanged: {

					if (activeFocus) {
						oInputTopWrapper.visible = false;
						oInputBottomWrapper.visible = false;
						oInputCenterWrapper.state = "active";
					} else {
						oInputTopWrapper.visible = true;
						oInputBottomWrapper.visible = true;
						oInputCenterWrapper.state = "inactive";
					}
				}
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

				onActiveFocusChanged: {

					if (activeFocus) {
						oInputTopWrapper.visible = false;
						oInputCenterWrapper.visible = false;
						oInputBottomWrapper.state = "active";
					} else {
						oInputTopWrapper.visible = true;
						oInputCenterWrapper.visible = true;
						oInputBottomWrapper.state = "inactive";
					}
				}
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