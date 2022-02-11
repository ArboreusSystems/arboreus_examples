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
import "qrc:/qml/Templates"


// Component
Rectangle {

	property alias pText: oLabel.text;
	property alias pColor: oRoot.color;

	id: oRoot;
	implicitWidth: parent ? parent.width : 0;
	implicitHeight: oLabel.height * 3;
	color: oRoot.ListView.isCurrentItem ? COLORS.mSaladDark(): model.Color;

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

	AMouseAreaTemplate {

		id: oMouseArea;
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.right: oButtonDelete.left;
		anchors.bottom: parent.bottom;

		onPressed: {

			if (oButtonDelete.visible) oButtonDelete.visible = false;
			oListView.currentIndex = model.index;
		}

		onSgSwipeDown: {

			if (model.index !== (model.count - 1)) {
				oListView.model.move(
					model.index,
					model.index + 1,
					1
				);
			}
		}

		onSgSwipeUp: {

			if (model.index !== 0) {
				oListView.model.move(
					model.index,
					model.index - 1,
					1
				);
			}
		}

		onPressAndHold: {

			oButtonDelete.visible = true;
			oButtonDelete.implicitWidth = oRoot.height;
		}
	}

	AButtonTemplate {

		id: oButtonDelete;
		objectName: "ButtonDelete";
		implicitHeight: oRoot.height;
		implicitWidth: 0;
		text: "D";
		anchors.right: parent.right;
		anchors.top: parent.top;
		visible: false;

		onClicked: {

			oRoot.implicitWidth = 0;
			oRoot.implicitHeight = 0;
			oRoot.color = COLORS.mTransparent();
			oListView.model.remove(model.index);
		}
	}

	Connections {

		target: oListView;
		function onCurrentIndexChanged() {

			if(model.index !== model.currentIndex) {
				if (oButtonDelete.visible) oButtonDelete.visible = false;
			}
		}
	}
}
