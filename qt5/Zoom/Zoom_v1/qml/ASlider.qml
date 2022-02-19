// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/08/2021 at 12:45:45
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Slider {

	id: oRoot;
	from: 1;
	to: 10;

	background: Rectangle {

		id: oLeftPart;
		x: oRoot.leftPadding;
		y: oRoot.topPadding + oRoot.availableHeight / 2 - height / 2;
		implicitWidth: 200;
		implicitHeight: 4;
		width: oRoot.availableWidth;
		height: implicitHeight;
		radius: 2;
		color: COLORS.mOrange();

		Rectangle {

			id: oRightPart;
			width: oRoot.visualPosition * parent.width;
			height: parent.height;
			color: COLORS.mSaladLight();
			radius: 2;
		}
	}

	onPositionChanged: {

		console.log("Slider position:",oRoot.position,"value:",oRoot.value);
	}
}
