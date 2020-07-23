/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tmpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 23/07/2020 at 17:07:51
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.12
import QtQuick.Window 2.12

// Application includes

// Application
Window {

	visible: true;
	width: 640;
	height: 480;
	title: qsTr("CPP Pointers");

	Text {

		id: pText;
		text: "CPP Pointers demo";
		font.pixelSize: 20;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;
	}
}
