// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2021 at 14:52:32
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application Path
import "qrc:/qml/Templates";
import "qrc:/qml/Buttons"


// Component
AHeader {

	id: oRoot;
	color: COLORS.mBlueDark();

	pRightBlock: AHeaderRightBlockTemplate {

		id: oRightBlock;
		rightPadding: oApplicationWindow.pMargin;

		AButtonHamburger {

			id: oButtonHamburger;
			height: parent.height * 0.64;
		}
	}
}
