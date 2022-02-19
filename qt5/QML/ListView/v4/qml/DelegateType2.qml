// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/06/2020 at 11:52:28
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/Colors.js" as COLORS;


// Component
Rectangle {

	property int pPadding: 15;

	id: oTextWrapper;
	color: oListView.currentIndex === index ? COLORS.mBlueDark() : COLORS.mOrangeLight();
	clip: true;
	implicitHeight: oText.implicitHeight + 2 * oTextWrapper.pPadding;
	implicitWidth: oListView.width;

	Text {

		id: oText;
		text: model.text;
		font.pixelSize: 18;
		width: parent.width - 2 * oTextWrapper.pPadding;
		wrapMode: Text.WordWrap;
		color: oListView.currentIndex === index ? COLORS.mWhiteLight() : COLORS.mBlack();
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;
		Component.onCompleted: {

			console.log("onCompleted",model.index,model.text);
		}
		Component.onDestruction: {

			console.log("onDestruction",model.index,model.text);
		}
	}

	MouseArea {

		id: oMouseArea;
		onClicked: oListView.currentIndex = index;
		anchors.fill: parent;
	}
}
