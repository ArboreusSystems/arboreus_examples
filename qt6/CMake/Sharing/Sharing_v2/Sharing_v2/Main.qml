// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/07/2026 at 21:55:37
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;


// Application Main window
Window {

	property string oTitle: "Main Window Sharing_v2";

	id: oMainWindow;
	visible: true;
	title: qsTr(oTitle);
	flags: Qt.Window | Qt.ExpandedClientAreaHint;

	Rectangle {

		anchors.fill: parent;
		color: "white";

		Text {

			id: oMainText;
			anchors.centerIn: parent;
			text: "This content is inside the safe area!"
		}
	}

	Connections {

		target: ASharingHandler;
		function onSgTextReceived(inText) {

			oMainText.text = inText;
		}
	}
}
