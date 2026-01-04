// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/01/2026 at 11:17:08
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 6.2

// Application includes
import AEnums 1.0


// Application Main window
Window {

	property string oTitle: "Main Window Enum_v1";

	id: oMainWindow;
	width: 640;
	height: 480;
	visible: true;
	title: qsTr(oTitle);

	Text {

		id: oMainText;
		text: qsTr(oTitle);
	}

	Component.onCompleted: {

		console.log("QML AEnumType1.Zero: " + AEnumType1.Zero);
		console.log("QML AEnumType1.Zero: " + AEnumType1.One);
		console.log("QML AEnumType1.Zero: " + AEnumType1.Two);
		console.log("QML AEnumType1.Zero: " + AEnumType1.Three);
	}
}
