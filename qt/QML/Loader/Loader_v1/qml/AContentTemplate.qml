// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/07/2021 at 17:20:16
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Rectangle {

	property string pText: "NoDefinedText";

	signal sgCompleted();
	signal sgDestruction();
	signal sgDestroyed();

	id: oRoot;
	anchors.fill: parent;

	Text {

		id: oText;
		text: oRoot.pText;
		color: COLORS.mWhiteLight();
		font.pixelSize: 23;
		font.bold: true;
		anchors.fill: parent;
		horizontalAlignment: Text.AlignHCenter;
		verticalAlignment: Text.AlignVCenter;
	}

	Component.onCompleted: {

		console.log(oRoot.pText,"Item Template onCompleted");
		oRoot.sgCompleted();
	}

	Component.onDestruction: {

		console.log(oRoot.pText,"Item Template onDestruction");
		oRoot.sgDestruction();
	}
}
