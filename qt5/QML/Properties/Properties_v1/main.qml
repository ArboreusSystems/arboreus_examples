// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/06/2021 at 14:50:48
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes

// Application paths
import "qrc:/qml";


// Application
ApplicationWindow {

	property string pText: qsTr("Properties v1");

	id: oApplicationWindow;
	width: 640;
	height: 480;
	visible: true;
	title: oApplicationWindow.pText;

	Column {

		id: oColumn;
		anchors.fill: parent;

		AText {

			id: oTestText0;

			Text {text: "world 0";}
		}

		AText {

			id: oTestText1;

			Text {text: "world 1.1";}
			Text {text: "world 1.2";}
			Text {text: "world 1.3";}
		}

		AText {

			id: oTestText2;
			pSomeText: Text {text: "world 2";}
		}

		AText {

			id: oTestText3;
			text: "world 3"
		}
	}
}
