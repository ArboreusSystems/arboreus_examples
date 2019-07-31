/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 31/07/2019 at 19:31:48
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.3

// Application includes
import "qrc:/sources/js/aGlobal.js" as GLOBAL;
import "qrc:/sources/js/aColors.js" as COLOR;

// Directories

// Component
Window {

	property bool isDesktop: GLOBAL.isDesktop();
	property real scaleRate: width/GLOBAL.uiWidth();

	id: applicationWindow;
	visible: true;
	width: isDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: isDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("Unit Test Example");

	Rectangle {

		id: contentWrapper;
		width: parent.width;
		height: parent.height;
		color: COLOR.white();

		Column {

			id: headerBlock;
			width: parent.width;
			anchors.top: parent.top;
			spacing: 10;

			Item {
				id: topPadding;
				width: parent.width;
				height: 20;
			}

			Text {
				id: labelApplication;
				width: parent.width;
				text: qsTr("Arboreus Qt Mobile Application");
				horizontalAlignment: Text.AlignHCenter;
				font.pointSize: 18;
			}

			Text {
				id: labelNotice;
				width: parent.width;
				text: qsTr("Unit Testing");
				horizontalAlignment: Text.AlignHCenter;
				font.pointSize: 18;
			}
		}

		Column {

			id: bottomBlock;
			width: parent.width;
			anchors.bottom: parent.bottom;
			spacing: 10;

			Rectangle {

				id: buttonExit;
				color: COLOR.blueDark();
				width: parent.width * 0.8;
				height: width * 0.25;
				anchors.horizontalCenter: parent.horizontalCenter;

				Text {

					id: buttonExitLabel;
					text: qsTr("Exit");
					anchors.horizontalCenter: parent.horizontalCenter;
					anchors.verticalCenter: parent.verticalCenter;
					color: COLOR.whiteClean();
					font.pointSize: 18;
				}

				MouseArea {

					id: buttonExitArea;
					anchors.fill: parent;
					onClicked: {
						console.log("Application exit");
					}
				}
			}

			Item {

				id: paddingButtom;
				width: parent.width;
				height: 30;
			}
		}
	}
}
