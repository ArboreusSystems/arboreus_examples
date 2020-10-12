// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/10/2020 at 23:28:34
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/Global.js" as GLOBAL;
import "qrc:/js/Colors.js" as COLORS;
import "qrc:/js/Text.js" as TEXTS;

// Application components
import "qrc:/qml/"


// Application window component
ApplicationWindow {

	property bool pIsDesktop: true;

	id: oMainWindow;
	visible: true;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("Custom Font");
	color: COLORS.mOrangeDark();

	Component.onCompleted: {

		console.log("Font family: ",AUISkin.mFontFamily());
		console.log("Font families custom: ",AUISkin.mFontFamiliesCustom());
	}

	AText {

		id: oTestText;
		pColorText: COLORS.mWhite();
		pTextSize: 18;
		pPadding: 15;
		color: COLORS.mFiolentDark();
		width: parent.width * 0.7;
		pText: TEXTS.mDefaultText();
		anchors.bottom: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;

		Component.onCompleted: {

			mSetSkin();
		}

		function mSetSkin() {

			oTestText.pTextFamily = AUISkin.mFontFamily();
		}
	}

	AButton {

		id: oButtonCaveat;
		text: AUISkin.mFontFamiliesCustom()[0];
		width: parent.width * 0.7;
		height: 40;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.top: oTestText.bottom;
		anchors.topMargin: 20;
	}

	AButton {

		id: oButtonOpenSansCondensed;
		text: AUISkin.mFontFamiliesCustom()[1];
		width: parent.width * 0.7;
		height: 40;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.top: oButtonCaveat.bottom;
		anchors.topMargin: 15;
	}

	AButton {

		id: oButtonPangolin;
		text: AUISkin.mFontFamiliesCustom()[2];
		width: parent.width * 0.7;
		height: 40;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.top: oButtonOpenSansCondensed.bottom;
		anchors.topMargin: 15;
	}

	AButton {

		id: oPhilosopher;
		text: AUISkin.mFontFamiliesCustom()[3];
		width: parent.width * 0.7;
		height: 40;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.top: oButtonPangolin.bottom;
		anchors.topMargin: 15;
	}
}
