// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/11/2020 at 20:30:29
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15;
import QtQuick.Controls 2.15;
import Qt.labs.qmlmodels 1.0

// Application includes
import "qrc:/js/AColor.js" as COLORS;
import "qrc:/js/AGlobal.js" as GLOBAL;

// Application Components
import "qrc:/qml/";


// Application window component
ApplicationWindow {

	property bool isDesktop: GLOBAL.mIsDesktop();
	property real scaleRate: width/GLOBAL.mUIWidth();

	id: oApplicationWindow;
	objectName: "oApplicationWindow";
	visible: true;
	width: isDesktop ? GLOBAL.mDesktopApplicationWidth() : maximumWidth;
	height: isDesktop ? GLOBAL.mDesktopApplicationHeight() : maximumHeight;
	title: qsTr("Altcoins v1");
	color: COLORS.mFiolentDark();

	Text {

		id: oPromoText;
		text: qsTr("Libbitcoin Example");
		color: COLORS.mWhite();
		font.pixelSize: 20;
		font.bold: true;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.top: parent.top;
		anchors.topMargin: 50;
	}

	Button {

		id: oButtonResetKeys;
		text: qsTr("Show Keys");
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		width: oApplicationWindow.width * 0.6;
		height: oApplicationWindow.height * 0.2;
		font.pixelSize: 26;
		font.bold: true;

		contentItem: Text {

			id: oButtonResetKeysText;
			text: oButtonResetKeys.text;
			font: oButtonResetKeys.font;
			color: oButtonResetKeys.down ? COLORS.mWhite() : COLORS.mWhite();
			horizontalAlignment: Text.AlignHCenter;
			verticalAlignment: Text.AlignVCenter;
		}

		background: Rectangle {

			id: oButtonResetKeysBackground;
			color: oButtonResetKeys.down ? COLORS.mRedDark() : COLORS.mSaladDark();
		}

		onClicked: {

			ALogger.mWriteToLog("Clicked Show Keys Button");
			ABitcoinKeys.mShowKeys();
		}
	}
}
