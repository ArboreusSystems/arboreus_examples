// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 05/10/2021 at 09:56:43
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
ListView {

	property var pModel: AStorage.mGetTableFieldNames();

	id: oListView;
	spacing: 5;
	anchors.fill: parent;

	delegate: Rectangle {

		id: oDelegate;
		color: model[oListView.pModel[1]];
		implicitWidth: oListView.width;
		implicitHeight: oText.height + 40;

		Text {

			id: oText;
			text: "CID: " + model[oListView.pModel[0]] + " Color: " + model[oListView.pModel[1]];
			width: parent.width;
			color: COLORS.mWhiteLight();
			font.bold: true;
			font.pixelSize: 20;
			anchors.centerIn: parent;
			horizontalAlignment: Text.AlignHCenter;
		}
	}
}
