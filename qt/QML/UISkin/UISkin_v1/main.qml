// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/09/2020 at 19:46:56
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/Global.js" as GLOBAL;
import "qrc:/js/Colors.js" as COLORS;

// Application directories
import "qrc:/qml/";


// Application window component
ApplicationWindow {

	property bool pIsDesktop: true;

	id: oApplicationWindow;
	flags: Qt.Window;
	visible: true;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;

	Rectangle {

		id: oContentWrapper;
		objectName: "oContentWrapper";
		color: ASkin.mGetColorFor("background");
		width: oApplicationWindow.width;
		height: oApplicationWindow.height;

		AText {

			id: oHeaderText;
			objectName: "oHeaderText";
			width: oContentWrapper.width * 0.8;
			height: 200;
			pText: qsTr("Change UI skin example");
			pTextSize: 20;
			pTextBold: true;
			anchors.bottom: oContentWrapper.verticalCenter;
			anchors.bottomMargin: 50;
			anchors.horizontalCenter: oContentWrapper.horizontalCenter;
		}

		AButton {

			id: oButtonSkin1;
			objectName: "oButtonSkin1";
			width: oHeaderText.width;
			height: 50;
			pText: "Skin1";
			anchors.horizontalCenter: oContentWrapper.horizontalCenter;
			anchors.top: oHeaderText.bottom;
			anchors.topMargin: 25;

			onClicked: {

				ALogger.mWriteToLog("Button: " + oButtonSkin1.objectName + " clicked");
				ASkin.mSetSkin("Skin1");
			}
		}

		AButton {

			id: oButtonSkin2;
			objectName: "oButtonSkin2";
			width: oHeaderText.width;
			height: 50;
			pText: "Skin2";
			anchors.horizontalCenter: oContentWrapper.horizontalCenter;
			anchors.top: oButtonSkin1.bottom;
			anchors.topMargin: 25;

			onClicked: {

				ALogger.mWriteToLog("Button: " + oButtonSkin2.objectName + " clicked");
				ASkin.mSetSkin("Skin2");
			}
		}

		AButton {

			id: oButtonSkin3;
			objectName: "oButtonSkin3";
			width: oHeaderText.width;
			height: 50;
			pText: "Skin3";
			anchors.horizontalCenter: oContentWrapper.horizontalCenter;
			anchors.top: oButtonSkin2.bottom;
			anchors.topMargin: 25;

			onClicked: {

				ALogger.mWriteToLog("Button: " + oButtonSkin3.objectName + " clicked");
				ASkin.mSetSkin("Skin3");
			}
		}

		Connections {

			target: ASkin;
			function onSgSkinChanged() {

				oContentWrapper.color = ASkin.mGetColorFor("background");
				ALogger.mWriteToLog("Skin changed for background: " + oContentWrapper.objectName);
			}
		}
	}
}
