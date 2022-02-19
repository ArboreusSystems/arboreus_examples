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
import QtWebEngine 1.10

// Application includes

// QML Components directories


// Application window
Window {

	id: oApplicationWindow;
	visible: true;
	width: 640;
	height: 480;
	title: qsTr("Sqlite example");

	Rectangle {

		id: contentWrapper;
		width: parent.width;
		height: parent.height;
		anchors.fill: parent;
		color: "white";

		WebEngineView {

			property string pDefaultUrl: "https://test.webrtc.org/";

			id: oWebEngineView;
			width: parent.width;
			height: parent.height;
			anchors.fill: parent;
			url: oWebEngineView.pDefaultUrl;
			onFeaturePermissionRequested: {

				console.log("onFeaturePermissionRequested")
				oWebEngineView.grantFeaturePermission(
					oWebEngineView.pDefaultUrl,
					WebEngineView.MediaAudioVideoCapture,
					true
				);
			}
		}
	}
}
