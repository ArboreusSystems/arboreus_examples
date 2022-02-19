// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/06/2021 at 19:45:31
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes

// Application
ApplicationWindow {

	property string pText: qsTr("Transition v1!");

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

	Rectangle {

		id: rect;
		width: 100;
		height: 100;
		color: "red";

		MouseArea {

			id: mouseArea;
			anchors.fill: parent;
		}

		states: [

			State {

				name: "pressed";
				when: mouseArea.pressed;

				PropertyChanges { target: rect; x: 50; y: 50; }
				PropertyChanges { target: rect; color: "blue"; }
			},

			State {

				name: "released";
				when: mouseArea.released;

				PropertyChanges { target: rect; color: "red"; }
			},

			State {

				name: "canceled";
				when: mouseArea.canceled;

				PropertyChanges { target: rect; color: "red"; }
			}
		]

		transitions: Transition {

			NumberAnimation {

				properties: "x,y,color";
				easing.type: Easing.InOutBounce;
			}
		}
	}
}
