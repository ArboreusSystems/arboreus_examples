// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/02/2022 at 19:41:27
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Item {

	property alias pSize: oLoaderSign.width;
	property alias pSizeSignItem: oLoaderSignItem1.width;
	property alias pSizeBorder: oLoaderSign.border.width;
	property alias pMargin: oLoaderSignItem1.anchors.leftMargin;
	property alias pBackgroundOpacity: oBackground.opacity;
	property alias pColorBackground: oBackground.color;
	property alias pColorSignBackground: oLoaderSign.color;
	property alias pColorSign: oLoaderSignItem1.color;
	property alias pColorSignCenter: oLoaderSignCenterItem.color;
	property alias pColorBorder: oLoaderSign.border.color;
	property alias pInterval: oTimer.interval;
	property alias pRadius: oLoaderSignItem1.radius;

	QtObject {

		property var pItems: [
			oLoaderSignItem1,oLoaderSignItem2,oLoaderSignItem3,
			oLoaderSignItem4,oLoaderSignItem5,oLoaderSignItem6,
			oLoaderSignItem7,oLoaderSignItem8
		];
		property var pCurrentItem: 0;

		id: oPrivate;

		function mDrawSignItems() {

			let oListLength = oPrivate.pItems.length;
			let oListOfElements = [];
			for (var i = 0; i < oListLength; i++) {
				var oPosition = i + oPrivate.pCurrentItem;
				if (oPosition >= oListLength) {
					oPosition = oPosition - oListLength;
				}
				oListOfElements[i] = oPosition
			}

			oPrivate.pItems[oListOfElements[7]].opacity = 1.0;
			oPrivate.pItems[oListOfElements[6]].opacity = 0.85;
			oPrivate.pItems[oListOfElements[5]].opacity = 0.60;
			oPrivate.pItems[oListOfElements[4]].opacity = 0.45;
			oPrivate.pItems[oListOfElements[3]].opacity = 0.30;
			oPrivate.pItems[oListOfElements[2]].opacity = 0.15;
			oPrivate.pItems[oListOfElements[1]].opacity = 0.0;
			oPrivate.pItems[oListOfElements[0]].opacity = 0.0;

			oPrivate.pCurrentItem++;
			if (oPrivate.pCurrentItem === oListLength) {
				oPrivate.pCurrentItem = 0;
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
		color: COLORS.mSaladLight();
		opacity: 0.75;
	}

	Rectangle {

		id: oLoaderSign;
		width: 70;
		height: oLoaderSign.width;
		color: COLORS.mFiolentDark();
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;
		radius: oRoot.pRadius * 0.33;
		border.width: oLoaderSign.width * 0.05;
		border.color: COLORS.mOrangeLight();

		Rectangle {

			id: oLoaderSignItem1;
			width: parent.width * 0.2;
			height: oRoot.pSizeSignItem;
			color: COLORS.mWhite();
			anchors.left: parent.left;
			anchors.leftMargin: 9;
			anchors.top: parent.top;
			anchors.topMargin: oRoot.pMargin;
			opacity: 0;
			radius: oLoaderSign.width * 0.5;
		}

		Rectangle {

			id: oLoaderSignItem2;
			width: oRoot.pSizeSignItem;
			height: oRoot.pSizeSignItem;
			color: oRoot.pColorSign;
			anchors.horizontalCenter: parent.horizontalCenter;
			anchors.top: parent.top;
			anchors.topMargin: oRoot.pMargin;
			opacity: 0;
			radius: oRoot.pRadius;
		}

		Rectangle {

			id: oLoaderSignItem3;
			width: oRoot.pSizeSignItem;
			height: oRoot.pSizeSignItem;
			color: oRoot.pColorSign;
			anchors.right: parent.right;
			anchors.rightMargin: oRoot.pMargin;
			anchors.top: parent.top;
			anchors.topMargin: oRoot.pMargin;
			opacity: 0;
			radius: oRoot.pRadius;
		}

		Rectangle {

			id: oLoaderSignItem4;
			width: oRoot.pSizeSignItem;
			height: oRoot.pSizeSignItem;
			color: oRoot.pColorSign;
			anchors.right: parent.right;
			anchors.rightMargin: oRoot.pMargin;
			anchors.verticalCenter: parent.verticalCenter;
			opacity: 0;
			radius: oRoot.pRadius;
		}

		Rectangle {

			id: oLoaderSignItem5;
			width: oRoot.pSizeSignItem;
			height: oRoot.pSizeSignItem;
			color: oRoot.pColorSign;
			anchors.right: parent.right;
			anchors.rightMargin: oRoot.pMargin;
			anchors.bottom: parent.bottom;
			anchors.bottomMargin: oRoot.pMargin;
			opacity: 0;
			radius: oRoot.pRadius;
		}

		Rectangle {

			id: oLoaderSignItem6;
			width: oRoot.pSizeSignItem;
			height: oRoot.pSizeSignItem;
			color: oRoot.pColorSign;
			anchors.horizontalCenter: parent.horizontalCenter;
			anchors.bottom: parent.bottom;
			anchors.bottomMargin: oRoot.pMargin;
			opacity: 0;
			radius: oRoot.pRadius;
		}

		Rectangle {

			id: oLoaderSignItem7;
			width: oRoot.pSizeSignItem;
			height: oRoot.pSizeSignItem;
			color: oRoot.pColorSign;
			anchors.left: parent.left;
			anchors.leftMargin: oRoot.pMargin;
			anchors.bottom: parent.bottom;
			anchors.bottomMargin: oRoot.pMargin;
			opacity: 0;
			radius: oRoot.pRadius;
		}

		Rectangle {

			id: oLoaderSignItem8;
			width: oRoot.pSizeSignItem;
			height: oRoot.pSizeSignItem;
			color: oRoot.pColorSign;
			anchors.left: parent.left;
			anchors.leftMargin: oRoot.pMargin;
			anchors.verticalCenter: parent.verticalCenter;
			opacity: 0;
			radius: oRoot.pRadius;
		}

		Rectangle {

			id: oLoaderSignCenterItem;
			width: oRoot.pSizeSignItem;
			height: oRoot.pSizeSignItem;
			color: COLORS.mOrangeLight();
			anchors.verticalCenter: parent.verticalCenter;
			anchors.horizontalCenter: parent.horizontalCenter;
			radius: oRoot.pRadius * 0.5;
		}

		Timer {

			id: oTimer;
			interval: 250;
			running: false;
			repeat: true;

			onTriggered: {

				oPrivate.mDrawSignItems();
			}
		}
	}
}

