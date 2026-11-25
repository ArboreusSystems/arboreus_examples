// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/11/2026 at 17:41:36
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;


// Application Main window
Window {

	property string oTitle: "UsingErlang_v1";

	id: oMainWindow;
	width: 640;
	height: 480;
	visible: true;
	title: qsTr(oTitle);

	Column {

		id: oColumn;
		width: parent.width * 0.8;
		spacing: 5;
		anchors.top: parent.top;
		anchors.topMargin: 10;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;

		Rectangle {

			width: parent.width;
			height: oMainWindow.height * 0.15;
		}

		Text {

			id: oTextNode;
			text: "Fully qualified node name"
			width: parent.width;
			horizontalAlignment: Text.AlignHCenter;
			verticalAlignment: Text.AlignVCenter;
		}

		Rectangle {

			color: "lightgrey";
			width: parent.width;
			height: 35;

			TextInput {

				id: oInputNodeName;
				anchors.fill: parent;
				horizontalAlignment: TextInput.AlignHCenter;
				verticalAlignment: TextInput.AlignVCenter;
			}
		}

		Text {

			id: oTextCookie;
			text: "Node Cookie"
			width: parent.width;
			horizontalAlignment: Text.AlignHCenter;
			verticalAlignment: Text.AlignVCenter;
		}

		Rectangle {

			color: "lightgrey";
			width: parent.width;
			height: 35;

			TextInput {

				id: oInputNodeCookie;
				anchors.fill: parent;
				horizontalAlignment: TextInput.AlignHCenter;
				verticalAlignment: TextInput.AlignVCenter;
			}
		}

		Button {

			id: oButtonPing;
			text: "Ping";
			width: parent.width;
			height: 35;

			onClicked: {

				if (oInputNodeName.text === "") {
					console.debug("Empty node name")
					return;
				}

				if (oInputNodeCookie.text === "") {
					console.debug("Empty cookie")
					return;
				}

				console.debug("Clicked button ping node");
				if (AErlangInterface.mNodePing(
					oInputNodeName.text,
					oInputNodeCookie.text
				)) {
					console.debug("Pong");
				} else {
					console.debug("Pang");
				}
			}
		}
	}
}
