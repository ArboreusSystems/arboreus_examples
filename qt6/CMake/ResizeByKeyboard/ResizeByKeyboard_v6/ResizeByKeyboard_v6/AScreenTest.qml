// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/06/2026 at 15:09:26
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 6.8;

// Application includes


// Component
AScreen {

	id: oRoot;
	color: "beige";

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

			onActiveFocusChanged: {

				if (activeFocus) {
					console.log("----------");
					console.log("---> oInputTop focus active");
				} else {
					console.log("----------");
					console.log("---> oInputTop focus inactive");
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
		anchors.verticalCenter: parent.verticalCenter;

		TextInput {

			id: oInputCenter;
			width: parent.width - 50;
			color: "white";
			height: 40;
			anchors.fill: parent;

			onActiveFocusChanged: {

				if (activeFocus) {
					console.log("----------");
					console.log("---> oInputCenter focus active");
				} else {
					console.log("----------");
					console.log("---> oInputCenter focus inactive");
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
					console.log("----------");
					console.log("---> oInputBottom focus active");
					oRoot.pContentWrapper.pIsBottom = true;

				} else {
					console.log("----------");
					console.log("---> oInputBottom focus inactive");
					oRoot.pContentWrapper.pIsBottom = false;
				}
			}
		}
	}

	Rectangle {

		id: oSignTopLeft;
		width: 10;
		height: 10;
		color: "magenta";
		anchors.top: parent.top;
		anchors.left: parent.left;
	}

	Rectangle {

		id: oSignTopRight;
		width: 10;
		height: 10;
		color: "magenta";
		anchors.top: parent.top;
		anchors.right: parent.right;
	}

	Rectangle {

		id: oSignBottomLeft;
		width: 10;
		height: 10;
		color: "magenta";
		anchors.bottom: parent.bottom;
		anchors.left: parent.left;
	}

	Rectangle {

		id: oSignBottomRight;
		width: 10;
		height: 10;
		color: "magenta";
		anchors.bottom: parent.bottom;
		anchors.right: parent.right;
	}
}
