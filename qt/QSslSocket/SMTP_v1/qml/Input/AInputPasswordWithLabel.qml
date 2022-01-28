// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/01/2022 at 18:22:33
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Templates";


// Component
AInputTextWithLabel {

	id: oRoot;

	pInputText.data: AInputText {

		id: oInputText;
		implicitHeight: 45;
		implicitWidth: parent.width;
		color: COLORS.mWhite();
		pTextEchoMode: TextInput.Password;
	}
}
