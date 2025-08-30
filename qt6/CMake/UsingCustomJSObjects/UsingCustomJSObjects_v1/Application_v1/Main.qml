// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/08/2025 at 21:58:38
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 6.2


// Application Main window
Window {

	property string oTitle: "Main Window Application_v1";

	id: oMainWindow;
	width: 640;
	height: 480;
	visible: true;
	title: qsTr(oTitle);

	Column {

		id: oColumn;

		Text {

			id: oMainText;
			text: qsTr(oTitle);
		}

		Text {

			id: oJSonObjectText;
			text: AJSObject.mTestString();
		}

		Text {

			id: oJSObjectLibrary1;
			text: AJSObjectLibrary2.mTestString();
		}

		Text {

			id: oJSObjectLibrary2;
			text: AJSObjectLibrary2.mTestString();
		}
	}
}
