/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 07/03/2019 at 21:09:19
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.9
import QtQuick.Window 2.2

// Application includes


// Application window
Window {
	visible: true
	width: 640
	height: 480
	title: qsTr("Hello World")

	Column {

		Text {
			id: text;
			text: qsTr(CustomObject.text());
		}

		Text {
			id: composedText;
			text: qsTr(CustomObject.composedText("text from JS/QML"));
		}

	}
}
