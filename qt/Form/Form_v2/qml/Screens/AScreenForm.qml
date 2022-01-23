// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/12/2021 at 20:43:35
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
import "qrc:/qml/Header";
import "qrc:/qml/Items";
import "qrc:/qml/Buttons";


// Component
AScreenTemplate {

	id: oRoot;
	color: COLORS.mPurple();
	pObjectName: "ScreenForm";
	pStackView: oApplicationStackView;

	Component.onCompleted: {

		console.log("11111");
	}

	AHeader {

		id: oHeader;
		height: 80;
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.right: parent.right;
	}

	ListModel {

		id: oListModel;

		Component.onCompleted: {

			for (var i = 0; i < 5; i++) {
				var iItem = {
					Text: 'Text_' + i,
					Value: i
				};
				oListModel.append(iItem);
			}
		}
	}

	ListView {

		id: oListView
		width: parent.width;
		spacing: 3;
		clip: true;
		anchors.top: oHeader.bottom;
		anchors.bottom: parent.bottom;
		anchors.left: parent.left;
		anchors.right: parent.right;
		model: oListModel;

//		delegate: AListViewItem {

//			id: oListViewDelegate;
//			pText: model.Text;
//		}

		delegate: AListViewItemSwipe {}

		onCurrentIndexChanged: {

			console.log("Current Index changed:",oListView.currentIndex);
		}

		onCurrentItemChanged: {

			console.log("Current Item changed:",oListView.currentItem);
		}
	}

	AButtonTemplate {

		id: oButtonAddItem;
		objectName: "ButtonAddItem";
		width: 60;
		height: 60;
		text: "+";
		font.bold: true;
		font.pixelSize: 22;
		anchors.right: parent.right;
		anchors.rightMargin: 40;
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: 40;

		onClicked: {

			var oCounter = oListModel.count;
			var oItem = {
				Text: 'Text_' + oCounter,
				Value: oCounter
			}
			oListModel.append(oItem);
		}
	}
}
