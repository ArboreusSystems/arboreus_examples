// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/08/2025 at 19:09:05
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 6.2


// Application Main window
Window {

	property string oTitle: "AppUsingJava_v5";

	id: oMainWindow;
	width: 640;
	height: 480;
	visible: true;
	title: qsTr(oTitle);

	Column {

		Text {

			id: oMainText;
			text: qsTr(oTitle);
		}

		Text {

			id: oIntegerFromJavaClass1;
			text: "Integer from AJavaClass1: " + AJavaClass1.mTest(1111);
		}
	}
}
