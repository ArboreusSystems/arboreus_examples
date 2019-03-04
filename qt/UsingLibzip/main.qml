/* -------------------------------------------------------------------
 *  @doc The using libzip example main.qml file
 *  @notice Template file qtquickapplication/empty/main.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 04/03/2019 at 12:45:06
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.9
import QtQuick.Window 2.2

// Application includes


// Application window
Window {
	visible: true;
	width: 640;
	height: 480;
	title: qsTr("Using libzip.org");

	Text {
		id: text;
		text: qsTr("AR|BO|RE|US Examples: Using libzip.org example.");
	}
}
