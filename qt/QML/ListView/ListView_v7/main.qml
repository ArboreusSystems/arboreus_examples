// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/07/2021 at 16:19:35
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AGlobal.js" as GLOBAL;
import "qrc:/js/AColors.js" as COLORS;


// Application
ApplicationWindow {

	property string pText: qsTr("ListView v7");
	property bool pIsDesktop: GLOBAL.mIsDesktop();

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	ListModel {

		id: oModel;

		ListElement {value: 0;} ListElement {value: 1;} ListElement {value: 2;}
		ListElement {value: 3;} ListElement {value: 4;} ListElement {value: 5;}
		ListElement {value: 6;} ListElement {value: 7;} ListElement {value: 8;}
		ListElement {value: 9;} ListElement {value: 10;} ListElement {value: 11;}
		ListElement {value: 12;} ListElement {value: 13;} ListElement {value: 14;}
		ListElement {value: 15;} ListElement {value: 16;} ListElement {value: 17;}
		ListElement {value: 18;} ListElement {value: 19;} ListElement {value: 20;}
	}

	Component {

		id: oDelegate;

		Rectangle {

			property int pItemID: model.value;
			property bool pActive: false;

			id: oDelegateItem;
			width: oListView.width;
			height: 50;
			color: COLORS.mOrangeDark();

			Text {

				id: oDelegateLabel;
				text: "Item " + oDelegateItem.pItemID;
				font.pixelSize: 20;
				font.bold: true;
				color: COLORS.mWhiteLight();
				anchors.centerIn: parent;
			}

			MouseArea {

				id: oDelegateMouseArea;
				anchors.fill: parent;
				onClicked: {

					console.log("Before click -> CurrentIndex:",oListView.currentIndex);
					console.log("Before click -> Index:",index);

					oListView.currentItem.pActive = false;

					console.log("Current Item: ",oListView.currentItem.pItemID);

					oListView.currentIndex = index;
					oListView.currentItem.pActive = true;

					console.log("Current Item: ",oListView.currentItem.pItemID);

					console.log("After click -> CurrentIndex:",oListView.currentIndex);
					console.log("After click -> Index:",index);
				}
			}

			states: [

				State {

					name: "ACTIVE";
					when: oDelegateItem.pActive;

					PropertyChanges {target: oDelegateItem;color: COLORS.mFiolentDark();}
					PropertyChanges {target: oDelegateLabel;color: COLORS.mSaladLight();}
				}
			]
		}
	}

	Rectangle {

		id: oApplicationWrapper;
		anchors.fill: parent;
		color: COLORS.mGreyLight();

		ScrollView {

			id: oScrollView;
			anchors.fill: parent;

			ListView {

				id: oListView;
				width: parent.width;
				model: oModel;
				delegate: oDelegate;
				clip: true;
				spacing: 5;

				onCurrentIndexChanged: {

					console.log("oListView onCurrentIndexChanged:",oListView.currentIndex);
				}

				onCurrentItemChanged: {

					console.log("oListView onCurrentItemChanged:",oListView.currentItem.pItemID);
				}
			}
		}
	}
}
