/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file qtquickapplication/empty/main.qml.tpl
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 05/03/2019 at 11:46:55
 * */// --------------------------------------------------------------

// System includes
import QtQuick 2.9
import QtQuick.Window 2.2
import Qt.labs.platform 1.1
import QtQuick.Controls 2.5

// Application includes


// Application window
Window {

	function isDesktop() {

		switch (Qt.platform.os) {
			case "macos": return true;
			case "osx": return true;
			case "windows": return true;
			case "linux": return true;
			default: return false;
		}
	}

	id: applicationWindow;
	visible: true;
	width: isDesktop ? 504 : maximumWidth;
	height: isDesktop ? 896 : maximumHeight;
	title: qsTr("Using StandardPaths");

	ScrollView {

		id: root;
		width: applicationWindow.width;
		height: applicationWindow.height;
		ScrollBar.horizontal.policy: ScrollBar.AlwaysOff;
		ScrollBar.vertical.policy: applicationWindow.isDesktop() ? ScrollBar.AsNeeded : ScrollBar.AlwaysOff;

		Column {

		width: applicationWindow.width;
		anchors.horizontalCenter: applicationWindow.horizontalCenter;

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "DesktopLocation: " + StandardPaths.writableLocation(StandardPaths.DesktopLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "DocumentsLocation: " + StandardPaths.writableLocation(StandardPaths.DocumentsLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "FontsLocation: " + StandardPaths.writableLocation(StandardPaths.FontsLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "ApplicationsLocation: " + StandardPaths.writableLocation(StandardPaths.ApplicationsLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "MusicLocation: " + StandardPaths.writableLocation(StandardPaths.MusicLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "PicturesLocation: " + StandardPaths.writableLocation(StandardPaths.PicturesLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "TempLocation: " + StandardPaths.writableLocation(StandardPaths.TempLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "HomeLocation: " + StandardPaths.writableLocation(StandardPaths.HomeLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "DataLocation: " + StandardPaths.writableLocation(StandardPaths.DataLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "CacheLocation: " + StandardPaths.writableLocation(StandardPaths.CacheLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "GenericCacheLocation: " + StandardPaths.writableLocation(StandardPaths.GenericCacheLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "GenericCacheLocation: " + StandardPaths.writableLocation(StandardPaths.GenericCacheLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "DataLocation: " + StandardPaths.writableLocation(StandardPaths.RuntimeLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "ConfigLocation: " + StandardPaths.writableLocation(StandardPaths.ConfigLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "GenericConfigLocation: " + StandardPaths.writableLocation(StandardPaths.GenericConfigLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "AppDataLocation: " + StandardPaths.writableLocation(StandardPaths.AppDataLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "AppLocalDataLocation: " + StandardPaths.writableLocation(StandardPaths.AppLocalDataLocation);
			}

			WrappedText {
				width: applicationWindow.width * 0.95;
				text: "AppConfigLocation: " + StandardPaths.writableLocation(StandardPaths.AppConfigLocation);
			}
		}
	}
}

