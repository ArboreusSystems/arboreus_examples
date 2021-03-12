/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 13/09/2019 at 21:07:30
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.12
import QtQuick.Window 2.12

// Application includes
import "qrc:/js/aGlobal.js" as GLOBAL;
import "qrc:/js/aColor.js" as COLOR;

// QML Directories
import "qrc:/qml";


// Application window
Window {

	property bool isDesktop: GLOBAL.isDesktop();
	property real scaleRate: width/GLOBAL.uiWidth();

	id: applicationWindow;
	visible: true;
	width: isDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: isDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("Sqlite example");

	Rectangle {

		id: contentWrapper;
		width: parent.width;
		height: parent.height;
		color: COLOR.white();

		Column {

			id: headerBlock;
			width: parent.width;
			anchors.top: parent.top;
			spacing: 20;

			Item {
				id: topPadding;
				width: parent.width;
				height: 30;
			}

			Text {
				id: labelApplication;
				width: parent.width;
				text: qsTr("Arboreus QT Examples");
				horizontalAlignment: Text.AlignHCenter;
				font.pointSize: 18;
			}

			Text {
				id: labelNotice;
				width: parent.width;
				text: qsTr("Sqlite Example");
				horizontalAlignment: Text.AlignHCenter;
				font.pointSize: 18;
			}

			Item {
				id: separator;
				width: parent.width;
				height: 50;
			}

			Component.onCompleted: {

				var oNames = [];
				for (var i = 0; i < 3; i++) {
					var oElement = Qt.createComponent("qrc:/qml/AInputField.qml");
					if (oElement.status === Component.Ready) {
						var oNewItem = oElement.createObject(headerBlock);
						var oName = "Element_" + i;
						oNewItem.objectName = oName;
						oNames.push(oName);
					}
				}
				var oButtonForm = Qt.createComponent("qrc:/qml/AFormButton.qml");
				if (oButtonForm.status === Component.Ready) {
					var oButtonFormItem = oButtonForm.createObject(headerBlock);
					oButtonFormItem.pText = "Write to db";
					oButtonFormItem.pObject = headerBlock;
					oButtonFormItem.pFields = oNames;
				}
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
				height: width * 0.2;
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
