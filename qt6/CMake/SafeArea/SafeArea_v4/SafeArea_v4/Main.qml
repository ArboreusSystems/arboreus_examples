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

	property string oTitle: "Main Window SafeArea_v4";
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
			anchors.fill: parent;
			anchors.topMargin: oMainWindow.SafeArea.margins.top;
			anchors.bottomMargin: oMainWindow.SafeArea.margins.bottom;
			anchors.leftMargin: oMainWindow.SafeArea.margins.left;
			anchors.rightMargin: oMainWindow.SafeArea.margins.right;

			Rectangle {

				id: oContent;
				anchors.fill: parent;
				color: oMainWindow.pColorBackgroundContent;

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
		}
	}
}
