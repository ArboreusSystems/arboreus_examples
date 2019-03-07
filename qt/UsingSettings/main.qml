/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 05/03/2019 at 14:01:32
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import Qt.labs.platform 1.1
import Qt.labs.settings 1.1

// Application includes


// Application window
Window {

	function isDesktop() {

		switch (Qt.platform.os) {
			case "macos": return true;
			case "osx": return true;
			case "windows": return true;
			case "linux": return true;
			default: return false;
		}
	}

	Settings {

		property string pathSettings: StandardPaths.writableLocation(StandardPaths.ConfigLocation);
		property string fileSettings: applicationSettings.pathSettings + "/test.settings";
		property string testValue: {
			return applicationSettings.value("testValue","11111");
		}

		id: applicationSettings;
		fileName: fileSettings;

		Component.onCompleted: {
			applicationSettings.setValue("testValue","testValueString");
		}
	}

	id: applicationWindow;
	visible: true;
	width: isDesktop ? 504 : maximumWidth;
	height: isDesktop ? 896 : maximumHeight;
	title: qsTr("Using StandardPaths");

	Column {

		width: applicationWindow.width * 0.95;

		Text {
			id: text;
			width: parent.width;
			text: applicationSettings.pathSettings;
			wrapMode: Text.WrapAnywhere;
		}

		Rectangle {
			id: wrapperTextArea;
			width: parent.width;
			height: textArea.height + 4;
			color: "black";

			TextArea {
				id: textArea;
				width: parent.width - 4;
				color: "white";
				anchors.verticalCenter: parent.verticalCenter;
				anchors.horizontalCenter: parent.horizontalCenter;
			}
		}

		Button {
			id: button;
			width: parent.width;
			onClicked: {
				textTestView.text = textArea.text;
				applicationSettings.setValue("testValue",textArea.text);
			}
		}



		Text {
			id: textTestValue;
			text: applicationSettings.value("testValue","11111");
		}

		Text {
			id: textTestView;
		}
	}
}
