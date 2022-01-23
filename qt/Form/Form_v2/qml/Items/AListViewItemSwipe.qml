// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/01/2022 at 20:18:47
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes

// Application paths
import "qrc:/qml/Templates";


// Component
AMouseAreaTemplate {



	id: oRoot;
	implicitWidth: parent.width;
	implicitHeight: 50;

	onSgSwipeRight: {

	}

	Rectangle {

		anchors.fill: parent;
		color: "green";
	}

	Item {

		id: oSwipeMenu;
		anchors.fill: parent;
	}

	Item {

		id: oHoldMenu;
		anchors.fill: parent;
	}
}
