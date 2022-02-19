/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tmpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 25/07/2020 at 12:44:56
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
	color: "#0800af";

	Text {

		id: pText;
		text: "CPP Pointers demo V3";
		font.pixelSize: 20;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;
		color: "white";
	}
}
