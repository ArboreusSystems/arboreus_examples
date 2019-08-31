// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 31/08/2019 at 15:07:16
	\endlist
*/
// ----------------------------------------------------------


// System includes
import QtQuick 2.12

// Application includes


// Component
Item {

	id: paddingButtom;
	objectName: "paddingButtom";
	width: parent.width;

	Component.onCompleted: {
		paddingButtom.width = parent.width
	}
}
