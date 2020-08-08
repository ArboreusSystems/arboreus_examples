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
		color: COLORS.mFiolent();
		anchors.fill: parent;
	}

	Connections {

		target: AGlobal;
		function onSgOrientationChanged(inOrientation) {

			mSetInsets();
			ALogger.mWriteToLog("Orientation: " + GLOBAL.mScreenOrientation(inOrientation));
			mSetUIForOrientation();
		}
	}

	function mSetUIForOrientation() {

		if (AGlobal.mIsLanscape()) {
			ALogger.mWriteToLog("Current orientation: Landscape");
		} else {
			ALogger.mWriteToLog("Current orientation: Portrait");
		}
	}

	function mSetInsets() {

		var oInsets = ASafeArea.mInsets();
		oSafeArea.anchors.topMargin = oInsets.pTop;
		ALogger.mWriteToLog("Inset pTop: " + oInsets.pTop);
		oSafeArea.anchors.bottomMargin = oInsets.pBottom;
		ALogger.mWriteToLog("Inset pBottom: " + oInsets.pBottom);
		oSafeArea.anchors.leftMargin = oInsets.pLeft;
		ALogger.mWriteToLog("Inset pLeft: " + oInsets.pLeft);
		oSafeArea.anchors.rightMargin = oInsets.pRight;
		ALogger.mWriteToLog("Inset pRight: " + oInsets.pRight);
	}
}
