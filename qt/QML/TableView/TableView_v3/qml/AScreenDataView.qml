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

	ATableViewModel {

		id: oListViewModel;
	}

	TableView {

		id: oListView;
		model: oListViewModel;
//		spacing: 5;
		anchors.fill: parent;

		delegate: Rectangle {

			id: oDelegate;
			color: model.ARow[1];
			implicitWidth: oListView.width;
			implicitHeight: oText.height + 40;

			Text {

				id: oText;
				text: model.ARow[2];
				width: parent.width;
				color: COLORS.mWhiteLight();
				font.bold: true;
				font.pixelSize: 20;
				anchors.centerIn: parent;
				horizontalAlignment: Text.AlignHCenter;
			}
		}

		Component.onCompleted: {

			var oTableInfo = AStorage.mGetTableInfo();
			for (var i = 0; i < oTableInfo.length; i++) {
				console.log(
					"CID:",oTableInfo[i]['CID'],
					"Name:",oTableInfo[i]['Name'],
					"Type:",oTableInfo[i]['Type']
				);
			}
		}
	}

	AButtonNew {

		id: oButtonNew;
		width: 60;
		height: 60;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: 50;

		onClicked: {

			console.log("Button Add New clicked");
			oApplicationStackView.push(oScreenAddNew);
		}
	}
}
