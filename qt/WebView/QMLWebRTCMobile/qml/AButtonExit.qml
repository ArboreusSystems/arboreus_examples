// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 17/09/2019 at 18:57:07
	\endlist
*/
// ----------------------------------------------------------


// System includes
import QtQuick 2.12

// Application includes
import "qrc:/js/aColor.js" as COLOR;


// Component
Rectangle {

	id: buttonExit;
	color: COLOR.blueDark();
	width: parent.width * 0.8;
	height: width * 0.2;
	anchors.horizontalCenter: parent.horizontalCenter;

	Text {

		id: buttonExitLabel;
		text: qsTr("Exit");
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;
		color: COLOR.whiteClean();
		font.pointSize: 18;
	}

	MouseArea {

		id: buttonExitArea;
		anchors.fill: parent;
		onClicked: {
			Qt.quit();
		}
	}
}
