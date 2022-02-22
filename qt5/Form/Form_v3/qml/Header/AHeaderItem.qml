// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/02/2022 at 13:11:25
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Templates";


// Component
Rectangle {

	id: oRoot;
	color: COLORS.mFiolentDark();

	AButtonTemplate {

		id: oButtonBack;
		objectName: "ButtonBack";
		text: "<";
		width: oRoot.height * 0.6;
		height: oButtonBack.width;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.left: parent.left;
		anchors.leftMargin: oRoot.height * 0.2

		onClicked: {

			oApplicationStackView.pop();
		}
	}

	Text {

		id: oHeader;
		text: "Add/Edit Item";
		color: COLORS.mWhiteLight();
		font.bold: true;
		font.pixelSize: 22;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.left: oButtonBack.right;
		anchors.right: oButtonOk.left;
		horizontalAlignment: Text.AlignHCenter;
		verticalAlignment: Text.AlignVCenter;
	}

	AButtonTemplate {

		id: oButtonOk;
		objectName: "ButtonOK";
		text: "Ok";
		width: oRoot.height * 0.6;
		height: oButtonBack.width;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.right: parent.right;
		anchors.rightMargin: oRoot.height * 0.2

		onClicked: {

			if (typeof oRoot.mOnButtonOKClicked === "function") {
				oRoot.mOnButtonOKClicked();
			} else {
				oApplicationStackView.pop();
			}
		}
	}
}
