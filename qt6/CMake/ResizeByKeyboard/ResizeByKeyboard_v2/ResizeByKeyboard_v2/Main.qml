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

	// Connections {

	// 	target: Qt.inputMethod
	// 	onKeyboardRectangleChanged: {

	// 		var newRect = Qt.inputMethod.keyboardRectangle
	// 		console.log(
	// 			"New keyboard rectangle size:" +
	// 			" x: " + newRect.x +
	// 			" y: " + newRect.y +
	// 			" width: " + newRect.width +
	// 			" height: " + newRect.height
	// 		)

	// 		// Your UI resizing / repositioning code goes here.
	// 	}
	// }

	// onActiveFocusItemChanged: {

	// 	if (activeFocusItem) {
	// 		switch (activeFocusItem.objectName){
	// 			case oInputTop.objectName:
	// 				console.log("Component objectName: InputTop");
	// 				break;
	// 			case oInputCenter.objectName:
	// 				console.log("Component objectName: InputCenter");
	// 				break;
	// 			case oInputBottom.objectName:
	// 				console.log("Component objectName: InputBottom");
	// 				break;
	// 			default:
	// 				console.log("No object");
	// 				break;
	// 		}
	// 	} else {
	// 		console.log("No an active focus");
	// 	}
	// }

	Rectangle {

		id: oWrapperContent;
		anchors.top: oBarTop.bottom;
		anchors.left: oBarLeft.right;
		anchors.right: oBarRight.left;
		anchors.bottom: oBarBottom.top;

		Rectangle {

			id: oContent;
			anchors.fill: parent;

			Rectangle {

				id: oInputTopWrapper;
				color: "orange";
				width: parent.width - 50;
				height: 40;
				anchors.top: parent.top;
				anchors.horizontalCenter: parent.horizontalCenter;

				TextInput {

					id: oInputTop;
					objectName: "InputTop";
					width: parent.width - 50;
					color: "white";
					height: 40;
					anchors.fill: parent;

					onActiveFocusChanged: {

						if (oInputTop.activeFocus) {
							console.debug("oInputTop focus active");
							Qt.inputMethod.show();
						} else {
							console.debug("oInputTop focus not active");
							Qt.inputMethod.hide();
						}
					}
				}
			}

			Rectangle {

				id: oInputCenterWrapper;
				color: "green";
				width: parent.width - 50;
				height: 40;
				anchors.verticalCenter: parent.verticalCenter;
				anchors.horizontalCenter: parent.horizontalCenter;

				TextInput {

					id: oInputCenter;
					objectName: "InputCenter";
					width: parent.width - 50;
					color: "white";
					height: 40;
					anchors.fill: parent;

					onActiveFocusChanged: {

						if (oInputCenter.activeFocus) {
							console.debug("oInputCenter focus active");
							Qt.inputMethod.show();
						} else {
							console.debug("oInputCenter focus not active");
							Qt.inputMethod.hide();
						}
					}
				}
			}

			Rectangle {

				id: oInputBottomWrapper;
				color: "blue";
				width: parent.width - 50;
				height: 40;
				anchors.bottom: parent.bottom;
				anchors.horizontalCenter: parent.horizontalCenter;

				TextInput {

					id: oInputBottom;
					objectName: "InputBottom";
					width: parent.width - 50;
					color: "white";
					height: 40;
					anchors.fill: parent;

					Component.onCompleted: {

						AKeyboard.disableKeyboardScroll(oInputBottom);
					}

					onActiveFocusChanged: {

						if (oInputBottom.activeFocus) {
							console.debug("oInputBottom focus active");
							Qt.inputMethod.show();
						} else {
							console.debug("oInputBottom focus not active");
							Qt.inputMethod.hide();
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
