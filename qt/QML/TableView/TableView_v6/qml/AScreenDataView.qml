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
import Qt.labs.qmlmodels 1.0
import Arboreus 1.0

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Rectangle {

	id: oRoot;
	color: COLORS.mWhite();

	ATableViewModel {

		id: oTableViewModel;
	}

	TableView {

		property var pModel: AStorage.mGetTableFieldNames();

		id: oTableView;
		model: oTableViewModel;
		columnSpacing: 2;
		rowSpacing: 4
		anchors.fill: parent;

		delegate: Rectangle {

			id: oDelegate;
			implicitWidth: oText.width + 150;
			implicitHeight: oText.height + 40;

			color: {

				var oColor = COLORS.mGreenDark();
				if (!((column + 1) % 3)) oColor = model[oTableView.pModel[1]];
				return oColor;
			}

			Text {

				id: oText;
				text: model['' + oTableView.pModel[column]];
				color: COLORS.mWhiteLight();
				font.bold: true;
				font.pixelSize: 20;
				anchors.centerIn: parent;
				horizontalAlignment: Text.AlignHCenter;
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
