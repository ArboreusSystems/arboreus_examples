// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2021 at 14:50:51
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes

// Application paths
import "qrc:/qml/Templates";


// Component
AHeaderButtonTemplate {

	id: oRoot;
	objectName: "ButtonHamburger";
	text: "H";

	onClicked: {

		if (oStackView.currentItem.objectName == "AScreenMenu") {
			oStackView.pop();
		} else {
			oStackView.push(oScreenMenu);
		}
	}
}
