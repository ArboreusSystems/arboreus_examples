// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/08/2021 at 16:18:00
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml";

// Component
Rectangle {

	id: oRoot;
	color: COLORS.mBlueLight();

	ScrollView {

		id: oScrollView;
		anchors.fill: parent;

		Column {

			id: oForm;
			width: parent.width;
			spacing: 5;

			AInputFieldTemplate {

				id: oFieldColor;
				pLabelText: "Enter color value";
			}

			AInputFieldTemplate {

				id: oFieldText;
				pLabelText: "Enter text value";
			}

			AButtonOk {

				id: oButtonOk;
				onClicked: {

					AStorage.mAdd(oFieldColor.pText,oFieldText.pText);
					oApplicationStackView.pop();
				}
			}

			AButtonCancel {

				id: oButtonCancel;
				onClicked: {

					oApplicationStackView.pop();
				}
			}
		}
	}
}
