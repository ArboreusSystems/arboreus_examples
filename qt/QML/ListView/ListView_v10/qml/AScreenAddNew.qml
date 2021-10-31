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

				id: oFieldFirstName;
				pLabelText: "Enter First Name";
			}

			AInputFieldTemplate {

				id: oFieldLastName;
				pLabelText: "Enter Last Name";
			}

			AInputFieldTemplate {

				id: oFieldPhone;
				pLabelText: "Enter Phone";
			}

			AButtonOk {

				id: oButtonOk;
				onClicked: {

					var oID = AStorage.mAdd(
						oFieldFirstName.pText,
						oFieldLastName.pText,
						oFieldPhone.pText
					);
					console.log("New Row ID:", oID);
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
