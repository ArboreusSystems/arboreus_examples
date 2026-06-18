// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/06/2026 at 14:41:34
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes


// Component
Rectangle {

	property alias pInput: oTextInput;

	id: oRoot;
	objectName: "ATextInput";

	TextInput {

		id: oTextInput;
		width: parent.width - 50;
		color: "white";
		height: 40;
		anchors.fill: parent;

		onActiveFocusChanged: {

			if (activeFocus) {
				console.log(oRoot.objectName + "active focus: true");
			} else {
				console.log(oRoot.objectName + "active focus: false");
			}
		}
	}
}
