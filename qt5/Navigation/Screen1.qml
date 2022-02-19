import QtQuick 2.12
import QtQuick.Controls 2.12


Rectangle {

	id: oScreenRoot;

	Component.onCompleted: {

		console.log("Created Screen 1: onCompleted");
	}

	Component.onDestruction: {

		console.log("Created Screen 1: onDestruction");
	}

	ScrollView {

		id: oScrollView;
		width: parent.width;
		height: parent.height;

		Column {

			id: oScreenContent;
			width: parent.width;

			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
			Text {text: qsTr("Screen 1"); width: parent.width;}
		}
	}
}
