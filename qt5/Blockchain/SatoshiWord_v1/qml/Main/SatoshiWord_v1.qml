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
	title: qsTr("Satoshi Word v1");
	color: COLORS.mPurpleDark();

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

	Rectangle {

		id: oSatoshiWordWrapper;
		width: parent.width - 30;
		height: oSatoshiWord.height + 25;
		color: COLORS.mGreen();
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;

		Text {

			id: oSatoshiWord;
			width: parent.width - 25;
			text: "No Satoshi word";
			color: COLORS.mWhite();
			wrapMode: Text.WordWrap;
			font.pixelSize: 30;
			font.bold: true;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.horizontalCenter: parent.horizontalCenter;
		}
	}

	Component.onCompleted: {

		oSatoshiWord.text = ABitcoin.mGetSatoshiWord();
	}
}
