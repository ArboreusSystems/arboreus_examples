// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/12/2021 at 03:11:21
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
ALoaderSignTemplate {

	id: oRoot;

	MouseArea {

		id: oAreaLocker;
		anchors.fill: parent;
		onClicked: {

			console.log("Area Locker clicked");
		}
	}
}
