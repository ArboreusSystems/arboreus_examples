// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/06/2026 at 07:42:43
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Window;


// Application Main window
Window {

	property string oTitle: "Main Window SafeArea_v3";

	id: oMainWindow;
	visible: true;
	visibility: Window.Maximized;
	title: qsTr(oTitle);

	Rectangle {

		id: oContentWrapper;
		anchors.fill: parent;
		anchors.topMargin: parent.SafeArea.margins.top;
		anchors.bottomMargin: parent.SafeArea.margins.bottom;
		anchors.leftMargin: parent.SafeArea.margins.left;
		anchors.rightMargin: parent.SafeArea.margins.right;
		color: "steelblue"

		Rectangle {

			id: oContent;
			anchors.fill: parent;
			color: "white";

			Text {

				id: oMainText;
				text: qsTr(oTitle);
				anchors.verticalCenter: parent.verticalCenter;
				anchors.horizontalCenter: parent.horizontalCenter;
			}
		}
	}
}
