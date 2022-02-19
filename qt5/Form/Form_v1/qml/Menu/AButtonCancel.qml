// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/11/2021 at 19:57:27
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes


// Component
AButtonTemplate {

	id: oRoot;
	objectName: "ButtonCancel";
	text: "Cancel";

	onClicked: {

		oApplicationStackView.pop();
	}
}
