// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/06/2021 at 18:51:41
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes


// Component
Item {

	property alias pLabel: oLabel.text;
	property alias pValue: oInput.pValue;

	id: oRoot;
	height: oContent.height;
	width: parent.width;

	Column {

		id: oContent;
		width: parent.width;
		spacing: 5;

		Text {

			id: oLabel;
			text: qsTr("Default label");
			width: parent.width;
		}

		ASeparator {

			id: oSeparator;
			width: parent.width;
		}

		ATextInput {

			id: oInput;
			width: parent.width;
		}
	}
}
