// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/11/2021 at 09:16:29
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Inputs";
import "qrc:/qml/Text";


// Component
Column {

	id: oForm;
	width: parent.width;
	spacing: 10;
	topPadding: 15;
	bottomPadding: 30;

	ATextHeader {

		id: oHeader;
		width: parent.width;
		text: "Education";
	}

	ATextInputWithLabel {

		id: oInputSchool;
		pLabelText: "School";
	}

	ATextInputWithLabel {

		id: oInputColledge
		pLabelText: "Colledge";
	}

	ATextInputWithLabel {

		id: oInputUniversity;
		pLabelText: "University";
	}

	ATextInputWithLabel {

		id: oInputOther
		pLabelText: "Other";
	}
}
