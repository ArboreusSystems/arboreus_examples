import QtQuick

Window {

	width: 640;
	height: 480;
	visible: true;
	title: qsTr("Hello World");

	Text {

		id: oText;
		text: qsTr("ApplicationInRoot v4");
	}
}
