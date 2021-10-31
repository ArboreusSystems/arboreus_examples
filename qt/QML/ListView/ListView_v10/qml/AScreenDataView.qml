// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/08/2021 at 16:13:49
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import Arboreus 1.0

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Rectangle {

	id: oRoot;
	color: COLORS.mWhite();

	Rectangle {

		id: oHeader;
		width: parent.width;
		height: 100;
		color: COLORS.mFiolentDark();
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.right: parent.right;

		AButtonDirection {

			id: oButtonDirection;
			width: oComboBox.height;
			height: oComboBox.height;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.left: parent.left;
			anchors.leftMargin: 20;

			Component.onCompleted: oButtonDirection.mSetState();

			onClicked: {

				console.log("Clicked oButtonDirection");
				oButtonDirection.mSetDirection();
				oButtonDirection.mSetState();
			}

			function mSetState() {

				if (oListViewModel.mGetDirection() === AEnumsDBSortingDirection.Ascendant) {
					oButtonDirection.state = "Ascendant";
				} else {
					oButtonDirection.state = "Descendant";
				}
			}

			function mSetDirection() {

				if (oListViewModel.mGetDirection() === AEnumsDBSortingDirection.Ascendant) {
					oListViewModel.mSetDirection(AEnumsDBSortingDirection.Descendant);
				} else {
					oListViewModel.mSetDirection(AEnumsDBSortingDirection.Ascendant);
				}
			}
		}

		AComboBox {

			id: oComboBox;
			height: oHeader.height * 0.5;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.left: oButtonDirection.right;
			anchors.leftMargin: 20;
			anchors.right: oButtonNew.left;
			anchors.rightMargin: 20;

			onActivated: {

				oListViewModel.mSort(oComboBox.pIndex);
			}

			Component.onCompleted: {

				var oModel = [];
				var oStructure = oListViewModel.mStructure();
				for (var i = 0; i < oStructure.length; i++) {
					oModel[i] = "Sort by: " + oStructure[i].DisplayName;
				}
				oComboBox.model = oModel;
			}
		}

		AButtonNew {

			id: oButtonNew;
			width: oComboBox.height;
			height: oComboBox.height;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.right: parent.right;
			anchors.rightMargin: 20;

			onClicked: {

				console.log("Button Add New clicked");
				oApplicationStackView.push(oScreenAddNew);
			}
		}
	}

	AListViewModel {

		id: oListViewModel;

		Component.onCompleted: {

			oListViewModel.mSetDirection(AEnumsDBSortingDirection.Ascendant);
		}
	}

	ListView {

		id: oListView;
		model: oListViewModel;
		spacing: 5;
		anchors.top: oHeader.bottom;
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.bottom: parent.bottom;
		cacheBuffer: 1000;
		clip: true;

		delegate: Rectangle {

			id: oDelegate;
			color: oDelegate.ListView.isCurrentItem ? COLORS.mSaladDark() : COLORS.mGreyLight();
			implicitWidth: oListView.width;
			implicitHeight: oDelegateContent.height + 25;

			MouseArea {

				id: oDelegateMouseArea;
				anchors.fill: parent;

				onClicked: {

					oListView.currentIndex = index;
				}
			}

			Column {

				id: oDelegateContent;
				width: parent.width;
				spacing: 5;
				anchors.top: parent.top;
				anchors.topMargin: oDelegate.ListView.isCurrentItem ? 10 : 8;
				leftPadding: 20;
				rightPadding: 20;

				Text {

					id: oTextFirstName;
					text: model.ARow[1];
					font.pixelSize: 18;
					font.bold: true;
					color: oDelegate.ListView.isCurrentItem ? COLORS.mWhite() : COLORS.mBlackDark();
				}

				Text {

					id: oTextLastName;
					text: model.ARow[2];
					font.pixelSize: 18;
					font.bold: true;
					color: oDelegate.ListView.isCurrentItem ? COLORS.mWhite() : COLORS.mBlackDark();
				}

				Text {

					id: oTextPhone;
					text: model.ARow[3];
					font.pixelSize: 16;
					color: oDelegate.ListView.isCurrentItem ? COLORS.mWhite() : COLORS.mBlackDark();
				}
			}

			Rectangle {

				id: oBottomBlock;
				width: parent.width;
				height: 3;
				color: oDelegate.ListView.isCurrentItem ? COLORS.mSaladLight() : COLORS.mGreyDark();
				anchors.bottom: parent.bottom;
			}
		}
	}
}
