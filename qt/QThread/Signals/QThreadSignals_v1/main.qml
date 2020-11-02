import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ApplicationWindow {

	id: oApplicationWindow;
	visible: true;
	width: 640;
	height: 480;
	title: qsTr("Hello World");

	Rectangle {

		id: oContentWrapper;
		width: oApplicationWindow.width;
		height: oApplicationWindow.height;

		Column {

			id: oNotices;
			width: parent.width
			anchors.top: parent.top;
			anchors.topMargin: parent.height * 0.1;
			anchors.horizontalCenter: parent.horizontalCenter;

			spacing: 3;

			Text {

				id: oApplicationNotice;
				text: qsTr("Arboreus Examples");
				width: parent.width;
				horizontalAlignment: Text.AlignHCenter;
			}

			Text {

				id: oApplicationName;
				text: qsTr("Using QThread with signals");
				width: parent.width;
				horizontalAlignment: Text.AlignHCenter;
			}
		}

		AButtonExit {

			id: oButtonExit;
			width: parent.width * 0.8;
			height: parent.height * 0.1;
			anchors.bottom: parent.bottom;
			anchors.bottomMargin: height * 0.5;
			anchors.horizontalCenter: parent.horizontalCenter;
		}
	}
}
