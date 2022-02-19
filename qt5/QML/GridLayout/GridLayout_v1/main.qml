// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/06/2021 at 13:37:34
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

// Application includes

// Application
ApplicationWindow {

	property string pText: qsTr("Hello world!");

	id: oApplicationWindow;
	width: 640;
	height: 480;
	visible: true;
	title: oApplicationWindow.pText;

	GridLayout {

		id: oLayout;
		columns: 2;
		rowSpacing: 5;
		columnSpacing: 5;
		anchors.fill: parent;

		Label { text: "field1";}
		TextField { id: field1; Layout.fillWidth: true; }

		Label { text: "field2";}
		TextField { id: field2; Layout.fillWidth: true; }

		Label { text: "field3";}
		TextField { id: field3; Layout.fillWidth: true; }

		Label { text: "field4";}
		TextField { id: field4; Layout.fillWidth: true; }

		Label { text: "field5";}
		TextField { id: field5; Layout.fillWidth: true; }

		Label { text: "field6";}
		TextField { id: field6; Layout.fillWidth: true; }
	}
}
