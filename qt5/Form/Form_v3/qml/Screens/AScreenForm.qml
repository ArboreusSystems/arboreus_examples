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


// Component
AScreen {

	id: oRoot;
	pObjectName: "ScreenForm";
	color: COLORS.mPurple();

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
					Value: i,
					Color: "" + COLORS.mRandom()
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

		delegate: AListViewItem {

			id: oListViewDelegate;
			pText: "Text: " + model.Text + ", Color: " + model.Color + ", Value: " + model.Value;
			pListView: oListView;
			pListModel: oListModel;

			function mOnButtonEditClicked() {

				var oFormData = oListModel.get(model.index);
				oApplicationStackView.push(
					"qrc:/qml/Screens/AScreenEdit.qml",
					{pFormData: oFormData, pIndex: model.index}
				);
			}
		}

		onCurrentIndexChanged: {

			console.log("Current index changed onto:", oListView.currentIndex);
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

			var oFormData = {
					Text: "",
					Value: "",
					Color: ""
				};

			oApplicationStackView.push(
				"qrc:/qml/Screens/AScreenEdit.qml",
				{pFormData: oFormData, pIndex: oListModel.count}
			);
		}
	}

	Connections {

		target: AUISignals;
		function onSgListViewItem(inIndex,inItemData) {

			var oItem = {
				"Text": inItemData.Text,
				"Color": inItemData.Color,
				"Value": Number(inItemData.Value)
			}

			if (oListModel.count === inIndex) {
				oListModel.append(oItem);
			} else {
				oListModel.set(inIndex,oItem);
			}
		}
	}
}
