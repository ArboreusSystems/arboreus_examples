// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/09/2020 at 17:31:00
	\endlist
*/
// ----------------------------------------------------------


// System includes
import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

// Application includes
import "qrc:/Global.js" as GLOBAL;
import "qrc:/Colors.js" as COLORS;


// Application
ApplicationWindow {

	property bool pIsDesktop: true;

	id: oApplicationWindow;
	flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;
	visible: true;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("UI Test");

	Rectangle {

		id: oContentWrapper;
		width: parent.width;
		height: parent.height;
		color: COLORS.mSaladDark();

		TextField {

			id: oTextField;
			width: oContentWrapper.width * 0.5;
			height: 50;
			font.pixelSize: 20;
			placeholderText: qsTr("Test text input");
			anchors.horizontalCenter: oContentWrapper.horizontalCenter;
			anchors.bottom: oContentWrapper.verticalCenter;
			anchors.bottomMargin: 20;
		}

		Button {

			id: oButton;
			objectName: "AButton";
			width: oContentWrapper.width * 0.5;
			height: oContentWrapper.height * 0.1;
			anchors.horizontalCenter: oContentWrapper.horizontalCenter;
			anchors.top: oTextField.bottom;
			anchors.topMargin: 20;
			onClicked: {

				ALogger.mWriteToLog("Button clicked");
				oText.text = oTextField.text;
			}

			contentItem: Text {

				id: oButtontext;
				width: parent.width;
				height: parent.height;
				text: qsTr("Test button");
				color: oButton.down ? COLORS.mBlack() : COLORS.mWhiteLight();
				font.pixelSize: 20;
				font.bold: true;
				horizontalAlignment: Text.AlignHCenter;
				verticalAlignment: Text.AlignVCenter;
			}

			background: Rectangle {

				id: oButtonBackground;
				width: parent.width;
				height: parent.height;
				color: oButton.down ? COLORS.mOrange() : COLORS.mFiolent();
			}
		}

		Rectangle {

			id: oTextWarpper;
			width: oContentWrapper.width;
			height: 70;
			color: COLORS.mWhite();
			anchors.bottom: oTextField.top;
			anchors.bottomMargin: 20;

			Text {

				id: oText;
				text: qsTr("No text in field");
				width: oTextWarpper.width - 6;
				height: oTextWarpper.height - 6;
				horizontalAlignment: Text.AlignHCenter;
				verticalAlignment: Text.AlignVCenter;
				color: COLORS.mFiolentDark();
				font.pixelSize: 30;
				font.weight: Font.Bold;
				anchors.horizontalCenter: oTextWarpper.horizontalCenter;
				anchors.verticalCenter: oTextWarpper.verticalCenter;
			}
		}
	}

	Timer {

		id: oTimer;

		function delay(delayTime, cb) {

			oTimer.interval = delayTime;
			oTimer.repeat = false;
			oTimer.triggered.connect(cb);
			oTimer.start();
		}
	}

	Component.onCompleted: {

		oTimer.delay(2000, function() {

			var oTextFieldCoordinates = oTextField.mapToItem(oTextField.parent,0,0);
			var oTextFieldCenterX = oTextFieldCoordinates.x + oTextField.width / 2;
			var oTextFieldCenterY = oTextFieldCoordinates.y + oTextField.height / 2;
			ALogger.mWriteToLog("oTextFieldCoordinates.x: " + oTextFieldCoordinates.x + " oTextFieldCoordinates.y: " + oTextFieldCoordinates.y);
			ALogger.mWriteToLog("oTextFieldCenterX: " + oTextFieldCenterX + " oTextFieldCenterY: " + oTextFieldCenterY);
			AUITest.mClick(oTextFieldCenterX,oTextFieldCenterY);
			AUITest.mKeys("Input test text",300);

			var oButtonCoordinates = oButton.mapToItem(oButton.parent,0,0);
			var oButtonCenterX = oButtonCoordinates.x + oButton.width / 2;
			var oButtonCenterY = oButtonCoordinates.y + oButton.height / 2;
			ALogger.mWriteToLog("oButtonCoordinates.x: " + oButtonCoordinates.x + " oButtonCoordinates.y: " + oButtonCoordinates.y);
			ALogger.mWriteToLog("oButtonCenterX: " + oButtonCenterX + " oButtonCenterY: " + oButtonCenterY);
			AUITest.mClick(oButtonCenterX,oButtonCenterY);
		})

		ALogger.mWriteToLog("Test message");
	}
}
