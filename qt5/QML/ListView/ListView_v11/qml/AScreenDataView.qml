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

	AAlphabetOrder {

		id: oAlphabetOrder;
		anchors.top: parent.top;
		anchors.bottom: parent.bottom;
		anchors.right: parent.right;
		pListViewModel: oListViewModel;
		pListView: oListView;
	}

	AListViewModel {

		id: oListViewModel;
	}

	ListView {

		id: oListView;
		objectName: "oListView";
		model: oListViewModel;
		spacing: 5;
		anchors.left: parent.left;
		anchors.right: oAlphabetOrder.left;
		anchors.top: parent.top;
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
