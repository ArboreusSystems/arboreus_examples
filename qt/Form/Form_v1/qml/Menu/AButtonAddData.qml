// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/11/2021 at 15:48:26
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes


// Component
AButtonTemplate {

	id: oRoot;
	text: "Add Data";
	height: 50;

	onClicked: {

		oApplicationStackView.push(oFormView);
	}
}
