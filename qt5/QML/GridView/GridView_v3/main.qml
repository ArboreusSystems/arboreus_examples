// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/07/2021 at 21:22:21
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

// Application includes
import "qrc:/js/AGlobal.js" as GLOBAL;
import "qrc:/js/AColors.js" as COLORS;


// Application
ApplicationWindow {

	property string pText: qsTr("GridView v3");
	property bool pIsDesktop: GLOBAL.mIsDesktop();
	property int pMargin: 10;

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	ListModel {

		id: oModel;

		ListElement {name: "Item 0";}
		ListElement {name: "Item 1";}
		ListElement {name: "Item 2";}
		ListElement {name: "Item 3";}
		ListElement {name: "Item 4";}
		ListElement {name: "Item 5";}
		ListElement {name: "Item 6";}
		ListElement {name: "Item 7";}
		ListElement {name: "Item 8";}
		ListElement {name: "Item 9";}
		ListElement {name: "Item 10";}
		ListElement {name: "Item 11";}
		ListElement {name: "Item 12";}
		ListElement {name: "Item 13";}
		ListElement {name: "Item 14";}
		ListElement {name: "Item 15";}
		ListElement {name: "Item 16";}
		ListElement {name: "Item 17";}
		ListElement {name: "Item 18";}
		ListElement {name: "Item 19";}
		ListElement {name: "Item 20";}
	}

	Component {

		id: oDelegateComponent;

		Rectangle {

			id: oDelegate;
			width: oGridView.cellWidth;
			height: oGridView.cellHeight;
			color: COLORS.mTransparent();

			Rectangle {

				id: oDelegateContent;
				width: oDelegate.width - oApplicationWindow.pMargin;
				height: oDelegate.height - oApplicationWindow.pMargin;
				anchors.centerIn: parent;
				color: model.index % 2 ? COLORS.mFiolent() : COLORS.mBlue();

				Text {

					id: oLabel;
					text: model.name;
					color: COLORS.mWhiteLight();
					font.pixelSize: 20;
					font.bold: true;
					anchors.centerIn: parent;
				}
			}
		}
	}

	Rectangle {

		id: oApplicationWrapper;
		anchors.fill: parent;
		color: COLORS.mOrange();

		Item {

			id: oGridViewWrapper;
			width: parent.width - oApplicationWindow.pMargin * 2 ;
			height: parent.height - oApplicationWindow.pMargin * 2;
			anchors.centerIn: parent;

			GridView {

				id: oGridView;
				model: oModel;
				delegate: oDelegateComponent;
				cellWidth: oGridView.width > oGridView.height ? oGridView.width * 0.5 : oGridView.width;
				anchors.fill: parent;
			}
		}
	}
}
