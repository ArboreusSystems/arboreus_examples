// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/07/2021 at 15:06:24
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

// Application paths
import "qrc:/qml";


// Application
ApplicationWindow {

	property string pText: qsTr("Loader v1");
	property bool pIsDesktop: GLOBAL.mIsDesktop();
	property int pMargin: 10;

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	Rectangle {

		id: oContentWrapper;
		anchors.fill: parent;
		color: COLORS.mSaladLight();

		RowLayout {

			id: oButtonsRow;
			anchors.top: parent.top;
			anchors.topMargin: oApplicationWindow.pMargin;
			anchors.left: parent.left;
			anchors.leftMargin: oApplicationWindow.pMargin;
			anchors.right: parent.right;
			anchors.rightMargin: oApplicationWindow.pMargin;
			height: 50;

			AButton {

				id: oButton1;
				text: "Content1";

				onClicked: {

					console.log("Button1 clicked");
					oItemLoader.source = "qrc:/qml/AContent1.qml";
				}
			}

			AButton {

				id: oButton2;
				text: "Content2";

				onClicked: {

					console.log("Button2 clicked");
					oItemLoader.source = "qrc:/qml/AContent2.qml";
				}
			}

			AButton {

				id: oButton3;
				text: "Content3";

				onClicked: {

					console.log("Button3 clicked");
					oItemLoader.source = "qrc:/qml/AContent3.qml";
				}
			}
		}

		Item {

			id: oLoadedItemWrapper;
			anchors.top: oButtonsRow.bottom;
			anchors.topMargin: oApplicationWindow.pMargin;
			anchors.left: parent.left;
			anchors.leftMargin: oApplicationWindow.pMargin;
			anchors.right: parent.right;
			anchors.rightMargin: oApplicationWindow.pMargin;
			anchors.bottom: parent.bottom;
			anchors.bottomMargin: oApplicationWindow.pMargin;

			Loader {

				id: oItemLoader;
				anchors.fill: parent;
				onLoaded: {

					console.log("Loaded",oItemLoader.item.pText);
				}
			}

			Connections {

				target: oItemLoader.item;
				function onSgCompleted() {

					console.log("Completed",oItemLoader.item.pText);
				}
			}

			Connections {

				target: oItemLoader.item;
				function onSgDestroyed() {

					console.log("Destroyed",oItemLoader.item.pText);
				}
			}

			Connections {

				target: oItemLoader.item;
				function onSgDestruction() {

					console.log("Destruction",oItemLoader.item.pText);
				}
			}

			Component.onCompleted: {

				console.log("oLoadedItemWrapper onCompleted");
			}

			Component.onDestruction: {

				console.log("oLoadedItemWrapper onDestroyed");
			}
		}
	}
}
