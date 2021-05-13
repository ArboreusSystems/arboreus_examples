// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/05/2021 at 09:03:50
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes

// Application
ApplicationWindow {

	property string pText: qsTr("CustomComponent v2");

	id: oApplicationWindow;
	width: 640;
	height: 480;
	visible: true;
	title: oApplicationWindow.pText;

	Text {

		id: oTestText;
		text: oApplicationWindow.pText;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
	}

	CustomComponent1 {

		id: oCustomComponent1;
		width: parent.width;
		pPadding: 10;
		pElementHight: 50;
		pLeftBlock: Rectangle {

			id: oLeftBlockWrapper;
			height: parent.height;
			width: parent.height * 2;
			color: "red";

			Rectangle {

				width: oCustomComponent1.pElementHight;
				height: oCustomComponent1.pElementHight;
				color: "green";
			}
		}
	}
}
