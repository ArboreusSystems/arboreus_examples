// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/11/2021 at 14:57:10
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
