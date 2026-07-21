// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2026 at 11:41:09
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes
import Arboreus;


// Application Main window
Window {

	property string pTitle: "Main Window Sharring_v1";

	id: oMainWindow;
	width: 640;
	height: 480;
	visible: true;
	title: qsTr(pTitle);

	ASharing {

		id: oSharing;
	}

	Column {

		width: parent.width;
		anchors.horizontalCenter: parent.horizontalCenter;
		spacing: 20;

		Label {

			text: oMainWindow.pTitle;
			font.pixelSize: 18;
			anchors.horizontalCenter: parent.horizontalCenter;
		}

		Rectangle {

			id: oTextInputWrapper;
			width: parent.width / 2;
			height: 30;
			anchors.horizontalCenter: parent.horizontalCenter;
			color: "blue"

			TextInput {

				id: oTextInput;
				anchors.fill: parent;
				text: "Write text here";
				color: "white";
			}
		}

		Button {

			text: "Share text";
			anchors.horizontalCenter: parent.horizontalCenter;
			onClicked: {

				oSharing.mShareText(oTextInput.text);
			}
		}
	}
}
