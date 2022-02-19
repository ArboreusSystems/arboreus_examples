// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/11/2021 at 08:24:17
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes

// Application paths
import "qrc:/qml/Menu";


// Component
AButtonTemplate {

	required property Item pCarousel;
	required property int pID;

	id: oRoot;
	leftPadding: 25;
	rightPadding: 25;
	height: parent.height;

	onClicked: {

		console.log("Emitting signal sgClicked with ID:",oRoot.pID);
		oRoot.pCarousel.sgClicked(oRoot.pID);
	}
}
