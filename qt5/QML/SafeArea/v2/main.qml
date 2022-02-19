/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tmpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 13/06/2020 at 19:21:26
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

// Application includes
import "qrc:/js/Global.js" as GLOBAL;
import "qrc:/js/Colors.js" as COLORS;


// Application
ApplicationWindow {

	property bool pIsDesktop: true;
	property string pLandscapeText: "Safe area Landscape";
	property string pPortraitText: "Safe area Portrait";

	id: oApplicationWindow;
	flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;
	visible: true;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("Safe area handling");
	Component.onCompleted: {

		mSetInsets();
		mSetUIForOrientation();
	}

	Rectangle {

		id: oSafeArea;
		anchors.fill: parent;

		Rectangle {

			id: oTopPadding;
			color: COLORS.mGreen();
			width: parent.width;
			anchors.bottom: parent.top;
		}

		Rectangle {

			id: oBottomPadding;
			color: COLORS.mBlue();
			width: parent.width;
			anchors.top: parent.bottom;
		}

		Text {

			id: oSafeAreaTitle;
			text: qsTr("Default text");
			color: COLORS.mWhite();
			font.pixelSize: 28;
			anchors.horizontalCenter: parent.horizontalCenter;
			anchors.verticalCenter: parent.verticalCenter;
		}
	}

	Rectangle {

		id: oLeftPadding;
		color: COLORS.mOrange();
		height: parent.height;
		anchors.right: oSafeArea.left;
	}

	Rectangle {

		id: oRightPadding;
		color: COLORS.mOrange();
		height: parent.height;
		anchors.left: oSafeArea.right;
	}

	Connections {

		target: AGlobal;

//		Uncomment it for older version of Qt
//		onSgOrientationChanged: onSgOrientationChanged(0);

		function onSgOrientationChanged(inOrientation) {

			ALogger.mWriteToLog("Orientation changed signal catch: " + GLOBAL.mScreenOrientation(inOrientation));
			mSetInsets();
			mSetUIForOrientation();
		}
	}

	function mSetUIForOrientation() {

		if (AGlobal.mIsLanscape()) {
			ALogger.mWriteToLog("Current orientation: Landscape");
			oSafeAreaTitle.text = oApplicationWindow.pLandscapeText;
			oSafeArea.color = COLORS.mRed();
		} else {
			ALogger.mWriteToLog("Current orientation: Portrait");
			oSafeAreaTitle.text = oApplicationWindow.pPortraitText;
			oSafeArea.color = COLORS.mFiolent();
		}
	}

	function mSetInsets() {

		var oInsets = ASafeArea.mInsets();

		oSafeArea.anchors.topMargin = oInsets.pTop;
		oSafeArea.anchors.bottomMargin = oInsets.pBottom;
		oSafeArea.anchors.leftMargin = oInsets.pLeft;
		oSafeArea.anchors.rightMargin = oInsets.pRight;

		oTopPadding.height = oInsets.pTop;
		oBottomPadding.height = oInsets.pBottom;
		oLeftPadding.width = oInsets.pLeft;
		oRightPadding.width = oInsets.pRight;

		ALogger.mWriteToLog("Inset pTop: " + oInsets.pTop);
		ALogger.mWriteToLog("Inset pBottom: " + oInsets.pBottom);
		ALogger.mWriteToLog("Inset pLeft: " + oInsets.pLeft);
		ALogger.mWriteToLog("Inset pRight: " + oInsets.pRight);
	}
}
