// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/05/2021 at 12:32:25
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import Arboreus 1.0

// Application includes

// Application
ApplicationWindow {

	property string pText: qsTr("Enum v3");

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

	Component.onCompleted: {

		console.log("EnumExample::One",EnumExample.One);
		console.log("EnumExample::Two",EnumExample.Two);
		console.log("EnumExample::Three",EnumExample.Three);
		console.log("EnumExample::Four",EnumExample.Four);
		console.log("EnumExample::Five",EnumExample.Five);

		AEnumTest.mPrintEnum(EnumExample.One);
	}
}
