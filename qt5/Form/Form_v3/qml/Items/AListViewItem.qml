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
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Templates";
import "qrc:/qml/Buttons";


// Component
Column {

	property alias pText: oText.text;
	property ListView pListView;
	property ListModel pListModel;

	id: oRoot;
	width: parent ? parent.width : 0;
	topPadding: 5;
	bottomPadding: 5;
	clip: false;

	Component.onCompleted: {

		console.log("ListView Item created");
	}

	Component.onDestruction: {

		console.log("ListView Item deleted");
	}

	Rectangle {

		color: oMouseAreaItem.pressed ? COLORS.mOrangeLight() :
				(oRoot.pListView.currentIndex === model.index) ? COLORS.mSaladLight() : COLORS.mOrangeDark();
		height: 50;
		width: parent.width;

		Text {

			id: oText;
			text: "NoDefinedText";
			anchors.fill: parent;
			verticalAlignment: Text.AlignVCenter;
			horizontalAlignment: Text.AlignHCenter;
		}

		MouseArea {

			id: oMouseAreaItem;
			anchors.fill: parent;

			onPressAndHold: {

				console.log("ListItem with index:",model.index,"pressed and hold");

				AUISignals.sgListViewItemShowMenuBar();
				oRoot.pListView.currentIndex = model.index;

				if (oMenuBar.visible) {
					oRoot.mHideMenuBar();
				} else {
					oRoot.mShowMenuBar();
				}
			}

			onClicked: {

				console.log("ListItem with index:",model.index,"clicked");

				AUISignals.sgListViewItemShowMenuBar();
				oRoot.pListView.currentIndex = model.index;

				if (oMenuBar.visible) {
					oRoot.mHideMenuBar();
				}
			}
		}
	}

	Rectangle {

		id: oMenuBar;
		color: COLORS.mSaladDark();
		height: 50;
		width: parent.width;
		visible: false;

		Row {

			id: oCentralMenu;
			height: parent.height * 0.7;
			spacing: 5;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.horizontalCenter: parent.horizontalCenter;

			AButtonItemDelete {

				id: oButtonDelete;
				objectName: "ButtonDelete";
				pSize: parent.height;

				function mOnClicked() {

					oRoot.pListModel.remove(model.index);
				}
			}

			AButtonItemEdit {

				id: oButtonEdit;
				objectName: "ButtonEdit";
				pSize: parent.height;

				function mOnClicked() {

					if (typeof oRoot.mOnButtonEditClicked === "function") {
						oRoot.mOnButtonEditClicked();
					}
				}
			}
		}

		AButtonItemMoveUp {

			id: oButtonUp;
			objectName: "ButtonMoveUp";
			pSize: parent.height * 0.7;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.left: parent.left;
			anchors.leftMargin: parent.height * 0.45;
			visible: model.index === 0 ? false : true;

			function mOnClicked() {

				oRoot.mMoveUp();
			}
		}

		AButtonItemMoveDown {

			id: oButtonDown;
			objectName: "ButtonMoveDown";
			pSize: parent.height * 0.7;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.right: parent.right;
			anchors.rightMargin: parent.height * 0.45;
			visible: model.index === (oRoot.pListView.count - 1) ? false : true;

			function mOnClicked() {

				oRoot.mMoveDown();
			}
		}
	}

	Connections {

		target: AUISignals
		function onSgListViewItemShowMenuBar() {

			oRoot.mHideMenuBar();
		}
	}

	function mShowMenuBar() {

		oMenuBar.visible = true;
	}

	function mHideMenuBar() {

		oMenuBar.visible = false;
	}

	function mMoveUp() {

		oRoot.pListModel.move(model.index,model.index - 1,1);
	}

	function mMoveDown() {

		oRoot.pListModel.move(model.index,model.index + 1,1);
	}
}
