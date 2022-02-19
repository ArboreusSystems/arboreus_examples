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

	Component.onCompleted: {

		oApplicationWindow.mSetPadding();
		oApplicationWindow.mSetContentSize();
	}

	Rectangle {

		id: oRootWrapper;
		anchors.fill: parent;

		Rectangle {

			id: oPaddingLeft;
			color: COLORS.mFiolent();
			height: parent.height;
			anchors.top: parent.top;
			anchors.left: parent.left;
		}

		Rectangle {

			id: oPaddingRight;
			color: COLORS.mFiolent();
			height: parent.height;
			anchors.top: parent.top;
			anchors.right: parent.right;
		}

		Rectangle {

			id: oPaddingTop;
			color: COLORS.mSaladDark();
			anchors.top: parent.top;
			anchors.left: oPaddingLeft.right;
			anchors.right: oPaddingRight.left;

			Text {

				id: oTextTop;
				text: qsTr("TopText");
				color: COLORS.mWhite();
				anchors.verticalCenter: parent.verticalCenter;
				anchors.horizontalCenter: parent.horizontalCenter;
				font.pixelSize: 24;
				font.bold: true;
			}
		}

		Rectangle {

			id: oPaddingBottom;
			color: COLORS.mSaladDark();
			anchors.bottom: parent.bottom;
			anchors.left: oPaddingLeft.right;
			anchors.right: oPaddingRight.left;

			Text {

				id: oTextBottom;
				text: qsTr("TextBottom");
				color: COLORS.mWhite();
				anchors.verticalCenter: parent.verticalCenter;
				anchors.horizontalCenter: parent.horizontalCenter;
				font.pixelSize: 24;
				font.bold: true;
			}
		}

		Rectangle {

			id: oContentWrapper;
			anchors.top: oPaddingTop.bottom;
			anchors.bottom: oPaddingBottom.top;
			anchors.left: oPaddingLeft.right;
			anchors.right: oPaddingRight.left;

			Rectangle {

				id: oContent;
				anchors.verticalCenter: parent.verticalCenter;
				anchors.horizontalCenter: parent.horizontalCenter;
				color: COLORS.mOrangeDark();
				transformOrigin: Item.Center;
				antialiasing: true;

				Text {

					id: oTextContent;
					text: qsTr("TextContent");
					anchors.verticalCenter: parent.verticalCenter;
					anchors.horizontalCenter: parent.horizontalCenter;
					font.pixelSize: 24;
					font.bold: true;
				}

				Rectangle {

					id: oSignTopLeft;
					width: 20;
					height: 20;
					color: COLORS.mPurple();
					anchors.top: parent.top;
					anchors.left: parent.left;
				}

				Rectangle {

					id: oSignTopRight;
					width: 20;
					height: 20;
					color: COLORS.mBlueLight();
					anchors.top: parent.top;
					anchors.right: parent.right;
				}

				Rectangle {

					id: oSignBottomRight;
					width: 20;
					height: 20;
					color: COLORS.mRedLight();
					anchors.bottom: parent.bottom;
					anchors.right: parent.right;
				}

				Rectangle {

					id: oSignBottomLeft;
					width: 20;
					height: 20;
					color: COLORS.mSaladLight();
					anchors.bottom: parent.bottom;
					anchors.left: parent.left;
				}
			}
		}
	}

	function mSetPadding() {

		oPaddingLeft.width = 30;
		oPaddingRight.width = 70;
		oPaddingTop.height = 50;
		oPaddingBottom.height = 100;
	}

	function mSetContentSize() {

		if (AGlobal.mIsLanscape()) {
			oContent.height = oRootWrapper.width - oPaddingLeft.width - oPaddingRight.width;
			oContent.width = oRootWrapper.height - oPaddingBottom.height - oPaddingTop.height;
		} else {
			oContent.height = oRootWrapper.height - oPaddingBottom.height - oPaddingTop.height;
			oContent.width = oRootWrapper.width - oPaddingLeft.width - oPaddingRight.width;
		}
	}

	Connections {

		target: AGlobal;
		function onSgOrientationChanged(inOrientation) {

			console.log("Orientation: ",GLOBAL.mScreenOrientation(inOrientation));
			console.log("Rotation:",oContent.rotation);
			switch (GLOBAL.mScreenOrientation(inOrientation)) {
				case "Landscape":
					oContent.rotation = 90;
					break;
				case "Portrait":
					oContent.rotation = 0;
					break;
				case "Landscape inverted":
					oContent.rotation = 270;
					break;
				case  "Portrait inverted":
					oContent.rotation = 0;
					break;
				default:
					break;
			}
			oApplicationWindow.mSetPadding();
			oApplicationWindow.mSetContentSize();
		}
	}
}
