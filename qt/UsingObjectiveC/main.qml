/* -------------------------------------------------------------------
 *  @doc QML Application
 *  @notice Template file qtquickapplication/empty/main.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/02/2019 at 18:26:13
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.9
import QtQuick.Window 2.3
import Custom.Component 1.0

// Application includes


// Application window
Window {
	visible: true;
	width: 640;
	height: 480;
	title: qsTr("Hello World");

	CustomComponent {
		id: customComponent;
	}

	Text {
		id: text;
		text: qsTr(customComponent.text);
	}
}
