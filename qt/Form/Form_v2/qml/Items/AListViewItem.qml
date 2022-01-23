// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/12/2021 at 15:56:38
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

	property alias pText: oLabel.text;

	id: oRoot;
	implicitWidth: parent.width;
	implicitHeight: oLabel.height * 2.5;
	color: oRoot.ListView.isCurrentItem ? COLORS.mSaladDark(): COLORS.mOrangeDark();

	Text {

		id: oLabel;
		text: "NoDefinedLabelText";
		width: parent.width;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.left: parent.left;
		anchors.right: parent.right;
		color: COLORS.mWhiteLight();
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		font.bold: true;
		font.pixelSize: 18;
	}

	MouseArea {

		id: oMouseArea;
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.right: oButtonDelete.left;
		anchors.bottom: parent.bottom;

		onClicked: {

			console.log("Clicked Item with index:",model.index);

			if (oButtonDelete.width > 0) {
				oButtonDelete.implicitWidth = 0;
				oButtonDelete.visible = false;
			}
			oListView.currentIndex = model.index;
		}

		onPressAndHold: {

			console.log("Pressed and Hold Item with index:",model.index);
			oButtonDelete.visible = true;
			oButtonDelete.implicitWidth = oButtonDelete.height;
		}
	}

	AButtonTemplate {

		id: oButtonDelete;
		objectName: "ButtonDelete";
		implicitHeight: parent.height;
		implicitWidth: 0;
		text: "D";
		anchors.right: parent.right;
		anchors.top: parent.top;
		visible: false;

		onClicked: {

			oRoot.implicitWidth = 0;
			oRoot.implicitHeight = 0;
			oListView.model.remove(model.index);
		}
	}
}
