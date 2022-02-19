/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tmpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 13/06/2020 at 19:21:26
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/Global.js" as GLOBAL;
import "qrc:/js/Colors.js" as COLORS;


// Application
ApplicationWindow {

	property bool pIsDesktop: true;

	id: oApplicationWindow;
	visible: true;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("Device orientation detect");

	Rectangle {

		id: oTextWrapper;
		width: parent.width;
		height: 200;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;

		Text {

			id: oTestText;
			text: qsTr("Test text");
			font.pointSize: 30;
			font.bold: true;
			anchors.horizontalCenter: parent.horizontalCenter;
			anchors.verticalCenter: parent.verticalCenter;
			color: COLORS.mWhite();
		}
	}

	Connections {

		target: AGlobal;
		function onSgOrientationChanged(inOrientation) {

			console.log("Orientation: ",GLOBAL.mScreenOrientation(inOrientation));
			if (AGlobal.mIsLanscape()) {
				oTextWrapper.color = COLORS.mGreenDark();
				oTestText.text = qsTr("Landscape");
				console.log("Current orientation: Landscape");
			} else {
				oTextWrapper.color = COLORS.mFiolentDark();
				oTestText.text = qsTr("Portrait");
				console.log("Current orientation: Portrait");
			}
		}
	}

	Component.onCompleted: {

		if (AGlobal.mIsLanscape()) {
			oTextWrapper.color = COLORS.mGreenDark();
			oTestText.text = qsTr("Landscape");
			console.log("Current orientation: Landscape");
		} else {
			oTextWrapper.color = COLORS.mFiolentDark();
			oTestText.text = qsTr("Portrait");
			console.log("Current orientation: Portrait");
		}
	}
}
