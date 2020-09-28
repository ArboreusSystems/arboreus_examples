// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/09/2020 at 16:48:16
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application directories
import "qrc:/qml/"


// Application window component
ApplicationWindow {

	id: oMainWindow;
	visible: true;
	width: 640;
	height: 480;
	title: qsTr("Hello World");

	AComponent {

		id: oContentWarapper;
		width: oMainWindow.width;
		height: oMainWindow.height;
		pContent: Rectangle {

			id: oContent;
			color: COLORS.mRed();
			width: 20;
			height: 20;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.horizontalCenter: parent.horizontalCenter;
		}
	}
}
