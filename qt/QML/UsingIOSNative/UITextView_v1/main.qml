// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/11/2021 at 19:06:03
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.2
import Arboreus 1.0

// Application includes

// Application
ApplicationWindow {

	property string pText: qsTr("UITextView v1");

	id: oApplicationWindow;
	width: 640;
	height: 480;
	visible: true;
	title: oApplicationWindow.pText;

	Rectangle {

		id: oApplicationWrapper;
		anchors.fill: parent;

		Rectangle {

			id: oUItextViewWrapper;
			width: 250;
			height: 50;
			color: "transparent";
			x: (Screen.desktopAvailableWidth - oUItextViewWrapper.width) / 2;
			y: (Screen.desktopAvailableHeight - oUItextViewWrapper.height) / 2;

			AUITextView {

				id: oUITextView;
				anchors.fill: parent;
			}
		}

		Text {

			id: oText;
			text: oApplicationWindow.pText;
			anchors.bottom: oUItextViewWrapper.top;
			anchors.bottomMargin: 20;
			anchors.horizontalCenter: oUItextViewWrapper.horizontalCenter;
		}
	}
}
