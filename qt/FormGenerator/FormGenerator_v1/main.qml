// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/06/2021 at 20:49:36
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

// Application includes
import "qrc:/js/AGlobal.js" as GLOBAL;
import "qrc:/js/AColors.js" as COLORS;
import "qrc:/js/AQMLFactory.js" as QML_FACTORY;

// Pathes
import "qrc:/qml";


// Application
ApplicationWindow {

	property string pText: qsTr("Form Generator v1");
	property bool pIsDesktop: true;

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	Column {

		property var pSchema: [
			{label:"Label 1"},
			{label:"Label 2"},
			{label:"Label 3"},
			{label:"Label 4"},
		];
		property var pForm: [];

		id: oForm;
		width: parent.width * 0.8;
		anchors.horizontalCenter: parent.horizontalCenter;
		spacing: 10;

		Rectangle {

			id: oHeaderForm;
			width: parent.width;
			height: 50;
			color: COLORS.mOrange();

			Text {

				id: oHeaderText;
				text: qsTr("Header text");
				width: parent.width;
				height: parent.height;
				anchors.verticalCenter: parent.verticalCenter;
				anchors.horizontalCenter: parent.horizontalCenter;
				verticalAlignment: Text.AlignVCenter;
				horizontalAlignment: Text.AlignHCenter;
			}
		}

		Column {

			id: oFormBody;
			width: parent.width;
			anchors.horizontalCenter: parent.horizontalCenter;

			Component.onCompleted: {

				for (var i = 0; i < oForm.pSchema.length; i++) {
					oForm.pForm[i] = QML_FACTORY.mCreateFormItem(
						"oFormItem" + i,
						oForm.pSchema[i].label,
						oFormBody,
						"oFormItem" + i
					);

					console.log(i,":",oForm.pSchema[i].label);
				}
			}
		}

		Rectangle {

			id: oFooter;
			width: parent.width;
			height: oFooterContent.height;

			Row {

				id: oFooterContent;
				height: oButtonOK.height;

				Button {

					id: oButtonCancel;
					text: "Cancel";

					onClicked: {

						console.log("Clicked Cancel");
					}
				}

				Button {

					id: oButtonOK;
					text: "OK";

					onClicked: {

						for (var i = 0; i < oForm.pForm.length; i++) {
							console.log(oForm.pForm[i].objectName,":",oForm.pForm[i].pValue)
						}

						console.log("Clicked OK");
					}
				}
			}
		}
	}
}
