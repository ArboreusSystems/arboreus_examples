// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/02/2022 at 18:45:01
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Item {

	property alias pSize: oImage1.width;
	property alias pBackgroundOpacity: oBackground.opacity;
	property alias pColorBackground: oBackground.color;

	QtObject {

		id: oPrivate;

		property var pImages: [
			oImage1,oImage2,oImage3,oImage4,oImage5,oImage6,
			oImage7,oImage8,oImage9,oImage10,oImage11,oImage12,
			oImage13,oImage14,oImage15,oImage16,oImage17,oImage18
		];
		property int pCurrentImage: 0;

		function mDrawSignImages() {

			let oListLength = oPrivate.pImages.length;
			let oListOfElements = [];
			for (var i = 0; i < oListLength; i++) {
				var oPosition = i + oPrivate.pCurrentImage;
				if (oPosition >= oListLength) {
					oPosition = oPosition - oListLength;
				}
				oListOfElements[i] = oPosition
			}

			oPrivate.pImages[oListOfElements[17]].opacity = 1.0;
			oPrivate.pImages[oListOfElements[16]].opacity = 0.9;
			oPrivate.pImages[oListOfElements[15]].opacity = 0.8;
			oPrivate.pImages[oListOfElements[14]].opacity = 0.7;
			oPrivate.pImages[oListOfElements[13]].opacity = 0.6;
			oPrivate.pImages[oListOfElements[12]].opacity = 0.5;
			oPrivate.pImages[oListOfElements[11]].opacity = 0.4;
			oPrivate.pImages[oListOfElements[10]].opacity = 0.3;
			oPrivate.pImages[oListOfElements[9]].opacity = 0.2;
			oPrivate.pImages[oListOfElements[8]].opacity = 0.1;
			oPrivate.pImages[oListOfElements[7]].opacity = 0.0;
			oPrivate.pImages[oListOfElements[6]].opacity = 0.0;
			oPrivate.pImages[oListOfElements[5]].opacity = 0.0;
			oPrivate.pImages[oListOfElements[4]].opacity = 0.0;
			oPrivate.pImages[oListOfElements[3]].opacity = 0.0;
			oPrivate.pImages[oListOfElements[2]].opacity = 0.0;
			oPrivate.pImages[oListOfElements[1]].opacity = 0.0;
			oPrivate.pImages[oListOfElements[0]].opacity = 0.0;

			oPrivate.pCurrentImage++;
			if (oPrivate.pCurrentImage === oListLength) {
				oPrivate.pCurrentImage = 0;
			}
		}
	}

	id: oRoot;
	anchors.fill: parent;

	Component.onCompleted: {

		oTimer.start();
	}

	Component.onDestruction: {

		oTimer.stop();
	}

	Rectangle {

		id: oBackground;
		anchors.fill: parent;
		color: COLORS.mWhite();
		opacity: 0.75;
	}

	Image {

		id: oImage1;
		width: 110;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_01.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage2;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_02.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage3;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_03.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage4;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_04.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage5;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_05.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage6;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_06.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage7;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_07.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage8;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_08.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage9;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_09.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage10;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_10.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage11;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_11.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage12;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_12.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage13;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_13.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage14;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_14.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage15;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_15.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage16;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_16.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage17;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_17.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Image {

		id: oImage18;
		width: oRoot.pSize;
		height: oRoot.pSize;
		source: "qrc:/img/LoaderSignRainbow/LoaderSign_Rainbow_18.svg";
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		opacity: 0.0;
	}

	Timer {

		id: oTimer;
		interval: 250;
		running: false;
		repeat: true;

		onTriggered: {

			oPrivate.mDrawSignImages();
		}
	}
}
