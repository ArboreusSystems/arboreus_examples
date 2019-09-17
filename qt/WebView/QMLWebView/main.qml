/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 17/09/2019 at 16:04:18
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.12
import QtQuick.Window 2.12
import QtWebView 1.1

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
		color: COLOR.white();

		Rectangle {

			id: headerBlock;
			width: parent.width;
			height: width * 0.15;
			color: COLOR.blueDark();
			anchors.top: parent.top;
			anchors.horizontalCenter: parent.horizontalCenter;

			Rectangle {

				id: urlBarWrapper;
				color: COLOR.whiteClean();
				width: parent.width * 0.95;
				height: parent.height * 0.6;
				anchors.verticalCenter: parent.verticalCenter;
				anchors.horizontalCenter: parent.horizontalCenter;

				TextInput {

					id: urlBar;
					text: webView.pDefaultUrl;
					layer.enabled: true;
					width: parent.width;
					height: parent.height;
					verticalAlignment: TextInput.AlignVCenter;
					font.pixelSize: parent.height * 0.6;
					anchors.fill: parent;
					leftPadding: parent.height * 0.1;
					rightPadding: parent.height * 0.1;
					onAccepted: {
						webView.url = text;
					}
					onFocusChanged: {
						if (urlBar.focus == true) {
							if (urlBar.text == webView.pDefaultUrl) {
								urlBar.text = "https://";
							}
						} else {
							if (urlBar.text == "" || urlBar.text == "https://") {
								urlBar.text = webView.pDefaultUrl;
							}
						}
					}
				}
			}
		}

		WebView {

			property string pDefaultUrl: "https://github.com/ArboreusSystems/arboreus_examples";

			id: webView;
			width: parent.width;
			height: parent.height - headerBlock.height;
			anchors.top: headerBlock.bottom;
			anchors.bottom: parent.bottom;
			url: webView.pDefaultUrl;
		}
	}
}
