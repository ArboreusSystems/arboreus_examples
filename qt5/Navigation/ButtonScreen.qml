import QtQuick 2.12

Rectangle {

	function mOnClicked() {}

	property string pText: "Default";
	property int pPadding: 4;

	id: oButtonScreen;
	color: "white"
	width: oButtonScreenText.width + 2 * pPadding;
	height: oButtonScreenText.height + 2 * pPadding;

	Text {

		id: oButtonScreenText;
		text: qsTr(oButtonScreen.pText);
		color: "blue";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		font.pixelSize: 15;
	}

	MouseArea {

		id: oButtonScreenMouseArea;
		anchors.fill: parent;
		onPressed: {

			oButtonScreen.color = "green";
			oButtonScreenText.color = "white"
		}
		onReleased: {

			oButtonScreen.color = "white";
			oButtonScreenText.color = "blue";
		}
		onCanceled: {

			oButtonScreen.color = "white";
			oButtonScreenText.color = "blue";
		}
		onClicked: {

			oButtonScreen.color = "white";
			oButtonScreenText.color = "blue";
			mOnClicked();
		}
	}
}
