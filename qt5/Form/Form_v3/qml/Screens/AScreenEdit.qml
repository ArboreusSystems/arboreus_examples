// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/02/2022 at 11:38:14
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Templates";
import "qrc:/qml/Header";
import "qrc:/qml/TextInputs";


// Component
AScreen {

	property var pFormData;
	property int pIndex;

	id: oRoot;
	pObjectName: "ScreenEdit";
	color: COLORS.mBlueLight();

	onPFormDataChanged: {

		oTextInputText.pText = oRoot.pFormData.Text;
		oTextInputValue.pText = oRoot.pFormData.Value;
		oTextInputColor.pText = oRoot.pFormData.Color;
	}

	AHeaderItem {

		id: oHeader;
		height: 80;
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.right: parent.right;

		function mOnButtonOKClicked() {

			var oItemData = {
				Text: oTextInputText.pText,
				Color: oTextInputColor.pText,
				Value: oTextInputValue.pText
			}

			AUISignals.sgListViewItem(oRoot.pIndex,oItemData);
			oApplicationStackView.pop();
		}
	}

	Column {

		id: oForm;
		width: parent.width * 0.8;
		topPadding: 30;
		leftPadding: parent.width * 0.1;
		spacing: 10;
		anchors.top: oHeader.bottom;

		ATextInputText {

			id: oTextInputText;
			pText: oRoot.pFormData.Text;
		}

		ATextInputColor {

			id: oTextInputColor;
			pText: oRoot.pFormData.Color;
		}

		ATextInputValue {

			id: oTextInputValue;
			pText: oRoot.pFormData.Value;
		}
	}
}
