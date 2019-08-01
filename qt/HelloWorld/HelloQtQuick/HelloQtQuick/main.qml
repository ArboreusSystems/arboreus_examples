/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 01/08/2019 at 13:58:06
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

// Application includes
import "qrc:/aGlobal.js" as GLOBAL;
import "qrc:/aColors.js" as COLOR;


// Application window
// Component
Window {

	property bool isDesktop: GLOBAL.isDesktop();
	property real scaleRate: width/GLOBAL.uiWidth();

	id: applicationWindow;
	visible: true;
	width: isDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: isDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("QtQuick Hello World");

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
				text: qsTr("Hello world");
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
						Qt.quit();
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
