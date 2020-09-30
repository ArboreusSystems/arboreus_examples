// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/09/2020 at 10:14:40
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/Global.js" as GLOBAL;
import "qrc:/js/Colors.js" as COLORS;
import "qrc:/js/Components.js" as COMPONENTS;


// Application directories
import "qrc:/qml/"


// Application window component
ApplicationWindow {

	property alias pContent: oWindowWrapper.data;
	property bool pIsDesktop: true;

	id: oRoot;
	visible: true;
	flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("Universal UI");

	Component.onCompleted: {

		oRoot.mSetSafeArea();
	}

	Rectangle {

		id: oWindowWrapper;
		color: COLORS.mGreen();
		width: parent.width;
		height: parent.height;

		Rectangle {

			id: oSafeAreaLeft;
			color: COLORS.mBlackDark();
			height: parent.height;
			anchors.top: parent.top;
			anchors.left: parent.left;
		}

		Rectangle {

			id: oSafeAreaRight;
			color: COLORS.mBlackDark();
			height: parent.height;
			anchors.top: parent.top;
			anchors.right: parent.right;
		}

		Rectangle {

			id: oSafeAreaTop;
			color: COLORS.mBlue();
			anchors.top: parent.top;
			anchors.left: oSafeAreaLeft.right;
			anchors.right: oSafeAreaRight.left;
		}

		Rectangle {

			id: oSafeAreaBottom;
			color: COLORS.mBlue();
			anchors.bottom: parent.bottom;
			anchors.left: oSafeAreaLeft.right;
			anchors.right: oSafeAreaRight.left;
		}

		Rectangle {

			id: oContentWarpper;
			color: COLORS.mTransparent();
			anchors.top: oSafeAreaTop.bottom;
			anchors.bottom: oSafeAreaBottom.top;
			anchors.left: oSafeAreaLeft.right;
			anchors.right: oSafeAreaRight.left;

			Component.onCompleted: {

				var oContentData;
				var oDeviceType = AGlobal.mDeviceType();
				if (oDeviceType === GLOBAL.DEVICE_TYPE_TABLET) {
					oContentData = Qt.createQmlObject(
						COMPONENTS.mAContentTablet(),oContentWarpper,"oContent"
					);
				} else if (oDeviceType === GLOBAL.DEVICE_TYPE_PHONE) {
					oContentData = Qt.createQmlObject(
						COMPONENTS.mAContentPhone(),oContentWarpper,"oContent"
					);
				} else if (oDeviceType === GLOBAL.DEVICE_TYPE_DESKTOP) {
					oContentData = Qt.createQmlObject(
						COMPONENTS.mAContentPhone(),oContentWarpper,"oContent"
					);
				} else {
					ALogger.mWriteToLog("Wrong device type. No content assigned for appllication window.");
				}
			}
		}
	}

	Connections {

		target: AGlobal;
		function onSgOrientationChanged(inOrientation) {

			oRoot.mSetSafeArea();
			ALogger.mWriteToLog("Orientation changed onto: " + inOrientation);
		}
	}

	function mSetSafeArea() {

		var oSafeArea = AGlobal.mDeviceSafeArea();

		oSafeAreaTop.height = oSafeArea.pTop;
		oSafeAreaBottom.height = oSafeArea.pBottom;
		oSafeAreaLeft.width = oSafeArea.pLeft;
		oSafeAreaRight.width = oSafeArea.pRight;
	}
}
