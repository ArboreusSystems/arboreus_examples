import QtQuick 2.0

Rectangle {

	id: oRoot;
	color: "blue";

	Text {

		id: oText;
		text: qsTr("Exit");
		anchors.verticalCenter: oRoot.verticalCenter;
		anchors.horizontalCenter: oRoot.horizontalCenter;
		color: "white";
		font.bold: true;
	}

	MouseArea {

		id: oMouseArea;
		anchors.fill: parent;
		onPressed: {oRoot.color = "green";}
		onCanceled: {oRoot.color = "blue";}
		onReleased: {oRoot.color = "blue";}
		onClicked: {

			oRoot.color = "blue";
			Qt.quit();
		}
	}
}
