// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 05/10/2021 at 09:53:40
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
TableView {

		property var pModel: AStorage.mGetTableFieldNames();

		id: oTableView;
		anchors.fill: parent;
		model: oAbstractModel;

		delegate: Rectangle {

			id: oDelegate;
			implicitWidth: oText.width + 150;
			implicitHeight: oText.height + 40;
			border.width: 1;

			border.color: {

				var oColor = COLORS.mBlackDark();
				if (!((column + 1) % 3)) oColor = model[oTableView.pModel[1]];
				return oColor;
			}

			color: {

				var oColor = COLORS.mGreyDark();
				if (!((column + 1) % 3)) oColor = model[oTableView.pModel[1]];
				return oColor;
			}

			Text {

				id: oText;
				text: model['' + oTableView.pModel[column]];
				font.bold: true;
				font.pixelSize: 20;
				anchors.centerIn: parent;
				horizontalAlignment: Text.AlignHCenter;

				color: {

					var oColor = COLORS.mBlackDark();
					if (!((column + 1) % 3)) oColor = COLORS.mWhiteLight();
					return oColor;
				}
			}
		}
	}
