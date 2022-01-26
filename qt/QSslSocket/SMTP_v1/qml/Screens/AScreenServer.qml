// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/01/2022 at 16:56:26
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Buttons";


// Component
Rectangle {

	id: oRoot;
	color: COLORS.mGreen();

	Rectangle {

		id: oHeader;
		color: COLORS.mRedDark();
		width: parent.width;
		height: 75;

		Text {

			id: oHeaderText;
			text: "SMTP Server Properties";
			color: COLORS.mWhiteLight();
			font.bold: true;
			font.pixelSize: 20;
			anchors.fill: parent;
			verticalAlignment: Text.AlignVCenter;
			horizontalAlignment: Text.AlignHCenter;
		}
	}

	AButtonCancel {

		id: oButtonCancel;
		width: parent.width * 0.8;
		height: 50;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: 50;
	}

	AButtonSetServer {

		id: oButtonSetServer;
		width: parent.width * 0.8;
		height: 75;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.bottom: oButtonCancel.top;
		anchors.bottomMargin: 20;
	}
}
