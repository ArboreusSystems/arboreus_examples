// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/11/2021 at 11:26:46
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Component
Rectangle {

	property alias pText: oText.text;
	property int pIndex: 0;
	required property ListView pListView;

	id: oRoot;
	color: oMouseArea.pressed ? COLORS.mBlueDark() : COLORS.mOrangeDark();
	width: 30;
	height: 30;

	Text {

		id: oText;
		text: "(!)";
		color: COLORS.mWhiteLight();
		anchors.fill: parent;
		font.bold: true;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
	}

	MouseArea {

		id: oMouseArea;
		anchors.fill: parent;

		onClicked: {

			console.log("Clicked",oText.text);

			oRoot.pListView.currentIndex = oRoot.pIndex;
			oRoot.pListView.positionViewAtIndex(oRoot.pIndex,ListView.Center);

			console.log("ListView index:",oRoot.pListView.currentIndex);
		}
	}
}
