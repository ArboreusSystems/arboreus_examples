// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/02/2026 at 07:35:00
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 6.2


// Application Main window
Window {

	property string oTitle: "Main Window DetectDeviceOrientation_v1";

	id: oMainWindow;
	width: 640;
	height: 480;
	visible: true;
	title: qsTr(oTitle);

	Text {

		id: oMainText;
		text: qsTr(oTitle);
	}
}
