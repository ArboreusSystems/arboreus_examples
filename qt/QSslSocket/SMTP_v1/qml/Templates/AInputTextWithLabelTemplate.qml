// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/01/2022 at 17:48:23
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes


// Component
Column {

	property alias pSeparator: oSeparator;
	property alias pLabel: oLabel;
	property alias pInputText: oInputText;

	id: oRoot;
	width: parent.width;

	Component.onCompleted: {

		oSeparator.implicitHeight = oSeparator.children[0].height;
		oLabel.implicitHeight = oLabel.children[0].height;
		oInputText.implicitHeight = oInputText.children[0].height;
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

		id: oInputText;
		implicitWidth: parent.width;
	}
}

