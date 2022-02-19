import QtQuick 2.12

Rectangle {

	id: oButtonExit;
	color: "blue";

	Text {

		id: oButtonExitText;
		text: qsTr("Exit");
		horizontalAlignment: Text.AlignHCenter;
		width: parent.width * 0.8;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		color: "white";
	}

	MouseArea {

		id: oButtonExitMouseArea;
		anchors.fill: parent;
		onPressed: {oButtonExit.color = "green";}
		onReleased: {oButtonExit.color = "blue";}
		onCanceled: {oButtonExit.color = "blue";}
		onClicked: {

			oButtonExit.color = "blee";
			Qt.quit();
		}
	}
}
