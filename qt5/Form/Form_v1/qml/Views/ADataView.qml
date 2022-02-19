// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/11/2021 at 15:39:44
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Menu";
import "qrc:/qml/Text";


// Component
Rectangle {

	id: oRoot;
	color: COLORS.mWhite();

	Rectangle {

		id: oApplicationNameWrapper;
		width: parent.width * 0.8;
		height: oApplicationName.height * 7;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.verticalCenterOffset: -oApplicationNameWrapper.height * 0.1;
		anchors.horizontalCenter: parent.horizontalCenter;
		color: COLORS.mPurpleDark();

		ATextHeader {

			id: oApplicationName;
			text: "Multipart Form";
			anchors.centerIn: parent;
			color: COLORS.mWhiteLight();
		}
	}

	AButtonAddData {

		id: oButtonAddData;
		anchors.bottom: parent.bottom;
		anchors.left: parent.left;
		anchors.right: parent.right;
	}
}
