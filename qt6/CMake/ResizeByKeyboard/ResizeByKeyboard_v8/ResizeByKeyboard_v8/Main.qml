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
Window {

	property string oTitle: "Main Window ResizeByKeyboard_v8";
	property string pColorBackgroundScreen: "navajowhite";
	property string pColorBackgroundContent: "steelblue";

	id: oMainWindow;
	visible: true;
	flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;
	title: qsTr(oTitle);

	Rectangle {

		id: oWindowWrapper;
		anchors.top: parent.top;
		anchors.bottom: parent.bottom;
		anchors.left: parent.left;
		anchors.right: parent.right;
		color: oMainWindow.pColorBackgroundScreen;

		Item {

			id: oContentWrapper;
			anchors.top: parent.top;
			anchors.bottom: parent.bottom;
			anchors.left: parent.left;
			anchors.right: parent.right;
			anchors.topMargin: oMainWindow.SafeArea.margins.top;
			anchors.bottomMargin: oMainWindow.SafeArea.margins.bottom;
			anchors.leftMargin: oMainWindow.SafeArea.margins.left;
			anchors.rightMargin: oMainWindow.SafeArea.margins.right;

			StackView {

				id: oContent;
				anchors.top: parent.top;
				anchors.bottom: parent.bottom;
				anchors.left: parent.left;
				anchors.right: parent.right;

				Component.onCompleted: {

					oContent.push(oScreenTest);
				}

				Component {id: oScreenTest; AScreenTest {}}
			}
		}
	}
}