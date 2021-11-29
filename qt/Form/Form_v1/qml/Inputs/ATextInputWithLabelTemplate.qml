// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 17/11/2021 at 08:24:58
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Column {

	property alias pSeparator: oSeparator;
	property alias pLabel: oLabel;
	property alias pTextInput: oTextInput;

	id: oRoot;
	width: parent.width;

	Component.onCompleted: {

		oSeparator.implicitHeight = oSeparator.children[0].height;
		oLabel.implicitHeight = oLabel.children[0].height;
		oTextInput.implicitHeight = oTextInput.children[0].height;
	}

	Item {

		id: oSeparator;
		implicitWidth: parent.width;
	}

	Item {

		id: oLabel;
		implicitWidth: parent.width;
	}

	Item {

		id: oTextInput
		implicitWidth: parent.width;
	}
}
