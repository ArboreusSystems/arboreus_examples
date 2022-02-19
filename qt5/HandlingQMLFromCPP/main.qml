/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 30/08/2019 at 13:17:07
 * */// --------------------------------------------------------------

// System includes
// System includes
import QtQuick 2.12
import QtQuick.Window 2.12

// Application includes
import "qrc:/aglobal.js" as GLOBAL;
import "qrc:/acolors.js" as COLOR;

// Application window
Window {

	property bool isDesktop: GLOBAL.isDesktop();
	property real scaleRate: width/GLOBAL.uiWidth();

	id: applicationWindow;
	visible: true;
	width: isDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: isDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("QtQuick Hello World");

	Item {

		id: jsWrapper;
		objectName: "jsWrapper";

		function mCreateComponents() {

			var oButtonExit = Qt.createComponent("qrc:/ButtonExit.qml");
			if (oButtonExit.status === Component.Ready) {
				var oItemButtonExit = oButtonExit.createObject(bottomBlock);
			}
			var oPaddingBottom = Qt.createComponent("qrc:/PaddingItem.qml");
			if (oPaddingBottom.status === Component.Ready) {
				var oItemPaddingBottom = oPaddingBottom.createObject(bottomBlock);
				oItemPaddingBottom.height = 30;
			}
		}
	}

	Rectangle {

		id: contentWrapper;
		width: parent.width;
		height: parent.height;
		color: COLOR.white();

		Column {

			id: headerBlock;
			objectName: "headerBlock";
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
				text: qsTr("Handling QML from C++");
				horizontalAlignment: Text.AlignHCenter;
				font.pointSize: 18;
			}
		}

		Column {

			id: bottomBlock;
			objectName: "bottomBlock";
			width: parent.width;
			anchors.bottom: parent.bottom;
			spacing: 10;
		}
	}
}
