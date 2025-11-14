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

	property string oTitle: "AppUsingCPPInJava_v2";

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

			id: oIntegerFromJava;
			text: "Integer from java: " + AJavaClass.mTest(1212);
		}
	}
}
