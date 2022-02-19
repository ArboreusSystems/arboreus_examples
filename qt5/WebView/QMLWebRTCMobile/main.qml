/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 17/09/2019 at 16:04:18
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Window 2.15
import QtWebView 1.15

// Application includes
import "qrc:/js/aGlobal.js" as GLOBAL;
import "qrc:/js/aColor.js" as COLOR;

// QML Components directories
import "qrc:/qml/";


// Application window
Window {

	property bool isDesktop: GLOBAL.isDesktop();
	property real scaleRate: width/GLOBAL.uiWidth();

	id: applicationWindow;
	visible: true;
	width: isDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: isDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("Sqlite example");

	Rectangle {

		id: contentWrapper;
		width: parent.width;
		height: parent.height;
		anchors.fill: parent;
		color: COLOR.white();

		WebView {

			property string pDefaultUrl: "https://test.webrtc.org/";

			id: oWebEngineView;
			width: parent.width;
			height: parent.height;
			anchors.fill: parent;
			url: oWebEngineView.pDefaultUrl;
			onLoadingChanged: {

				if (oWebEngineView.loading == false) {
					console.log("Loading false");
					oWebEngineView.runJavaScript(
						"navigator.mediaDevices.getUserMedia({audio: true,video: {facingMode: \"user\"}});",
						function(result) {
							console.log(result);
						}
					);
				} else {
					console.log("Loading true");
				}
			}
		}
	}
}
