// ----------------------------------------------------------
/*!
    \qmltype
    \brief

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 26/10/2026 at 16:12:24
    \endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Window;


// Application Main window
Window {

	property string pTitle: "Main Window RevenueCat_v1";
	property string pColorBackgroundScreen: "navajowhite";
	property string pColorBackgroundContent: "steelblue";

	id: oMainWindow;
	visible: true;
	flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;
	title: qsTr(oMainWindow.pTitle);

	Rectangle {

		id: oWindowWrapper;
		anchors.top: parent.top;
		anchors.bottom: parent.bottom;
		anchors.left: parent.left;
		anchors.right: parent.right;
		color: oMainWindow.pColorBackgroundScreen;

		Rectangle {

			id: oContentWrapper
			anchors.top: parent.top;
			anchors.topMargin: oMainWindow.SafeArea.margins.top;
			anchors.bottom: parent.bottom;
			anchors.bottomMargin: oMainWindow.SafeArea.margins.bottom;
			anchors.left: parent.left;
			anchors.leftMargin: oMainWindow.SafeArea.margins.left;
			anchors.right: parent.right;
			anchors.rightMargin: oMainWindow.SafeArea.margins.right;

			StackView {

				id: oStackView;
				anchors.top: parent.top;
				anchors.bottom: parent.bottom;
				anchors.left: parent.left;
				anchors.right: parent.right;

				Component.onCompleted: {

					oStackView.push(oScreenMain);
				}

				Component {id: oScreenMain; AScreenMain {}}

			}
		}
	}
}
