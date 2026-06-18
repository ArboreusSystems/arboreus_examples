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
import QtQuick;
import QtQuick.Controls;

// Application includes


// Component
AScreen {

	id: oRoot;
	color: "lightskyblue";

	ATextInput {

		id: oInputTopWrapper;
		objectName: "oInputTopWrapper";
		color: "steelblue";
		width: parent.width - 50;
		height: 40;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.top: parent.top;

		pInput.onActiveFocusChanged: {

			oRoot.pBottomInput = false;
		}
	}

	ATextInput {

		id: oInputCenterWrapper;
		objectName: "oInputCenterWrapper";
		color: "green";
		width: parent.width - 50;
		height: 40;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;

		pInput.onActiveFocusChanged: {

			oRoot.pBottomInput = false;
		}
	}

	ATextInput {

		id: oInputBottomWrapper;
		objectName: "oInputBottomWrapper";
		color: "purple";
		width: parent.width - 50;
		height: 40;
		anchors.bottom: parent.bottom;
		anchors.horizontalCenter: parent.horizontalCenter;

		pInput.onActiveFocusChanged: {

			if (oInputBottomWrapper.pInput.activeFocus) {
				oRoot.pBottomInput = true;
				console.log("Defined active pBottomInput: " + oRoot.pBottomInput);
			} else {
				oRoot.pBottomInput = false;
				console.log("Defined hidden pBottomInput: " + oRoot.pBottomInput);
			}

			console.log("Active focus changed");
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
