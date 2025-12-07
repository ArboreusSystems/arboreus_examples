// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/09/2025 at 21:47:15
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 6.2


// Application Main window
Window {

	property string oTitle: "Main Window OpenSSL_v2";

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
