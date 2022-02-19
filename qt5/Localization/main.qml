/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tmpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 24/05/2020 at 15:40:05
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.14

// Application includes

// Application
Window {

	id: aMainWindow;
	visible: true;
	width: 640;
	height: 480;
	title: qsTr("aMainWindow.title");

	Text {

		id: aTitle;
		text: qsTr("aMainWindow.aTitle.text");
		anchors {
			horizontalCenter: parent.horizontalCenter;
			top: parent.top;
			topMargin: 50;
		}
	}

	Text {

		id: aTestText;
		text: qsTr("aMainWindow.aTestText.text");
		anchors {
			horizontalCenter: parent.horizontalCenter;
			verticalCenter: parent.verticalCenter;
			verticalCenterOffset: -40;
		}
	}

	Column {

		id: aLanguageButtons;
		spacing: 5;
		anchors {

			bottom: parent.bottom;
			bottomMargin: 100;
			horizontalCenter: parent.horizontalCenter;
		}

		Button {

			id: aButtonRUS;
			text: "RUS";
			onClicked: ATranslator.mSetLanguage("ru");
		}

		Button {

			id: aButtonENG;
			text: "ENG";
			onClicked: ATranslator.mSetLanguage("en");
		}
	}

	Component.onCompleted: {

		ATranslator.mSetLanguage("en");
	}

	Connections {

		target: ATranslator;
		function onSgLanguageChanged() {
			aMainWindow.mSetLanguage();
		}
	}

	function mSetLanguage() {

		aMainWindow.title = qsTr("aMainWindow.title");
		aTitle.text = qsTr("aMainWindow.aTitle.text");
		aTestText.text = qsTr("aMainWindow.aTestText.text");
		console.log("Language changed");
	}
}
