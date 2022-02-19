/* -------------------------------------------------------------------
 *  @doc Custom QML component demonstration
 *  @notice Template file qtquickapplication/empty/main.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 27/02/2019 at 10:35:12
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.9
import QtQuick.Window 2.3
import Arboreus.examples.cutomQMLComponent 1.0

// Application includes


// Application window
Window {
	visible: true
	width: 640
	height: 480
	title: qsTr("C++ Custom QML Component")

	CustomComponent {
		id: customComponent;
	}

	Column {

		Text {
			id: customText;
			text: qsTr(customComponent.customText);
		}

		Text {
			id: changableText1;
			text: qsTr(customComponent.changableText);
		}

		Text {
			id: changableText2;
			Component.onCompleted: {
				customComponent.changableText = "New changable text";
				changableText2.text = customComponent.changableText;
			}
		}
	}
}
