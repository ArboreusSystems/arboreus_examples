// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/09/2026 at 14:53:52
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Layouts;


// Application Main window
Window {

	property string oTitle: "Main Window ProhibitScreenshots_v3";

	id: oMainWindow;
	width: 640;
	height: 480;
	visible: true;
	title: qsTr(oTitle);

	Rectangle {

		anchors.fill: parent;
		color: "cornflowerblue";

		ColumnLayout {

			anchors.centerIn: parent;
			spacing: 20;
			width: parent.width * 0.85;

			Text {

				text: "Some secret";
				color: "white";
				font.pixelSize: 16;
				Layout.alignment: Qt.AlignHCenter;
			}

			Rectangle {

				Layout.fillWidth: true;
				height: 100;
				color: "beige";
				radius: 12;

				ColumnLayout {

					anchors.centerIn: parent;
					spacing: 8;

					Text {

						id: oSensitiveData;
						text: "Sensitive Data";
						color: "navy";
						font.pixelSize: 28;
						font.bold: true;
					}
				}
			}

			Rectangle {

				Layout.fillWidth: true;
				height: 50;
				color: "white";
				radius: 8;
				visible: APrivacy.mIsScreenRecording;

				Text {

					anchors.centerIn: parent;
					text: "Screen Recording Detected";
					color: "red";
					font.bold: true;
				}
			}
		}

		Rectangle {

			id: oScreenshotNotice;
			anchors.bottom: parent.bottom;
			anchors.bottomMargin: 40;
			anchors.horizontalCenter: parent.horizontalCenter;
			width: parent.width * 0.8;
			height: 45;
			color: "red";
			radius: 22;
			opacity: 0.0;

			Text {

				anchors.centerIn: parent;
				text: "Screenshot detected";
				color: "white";
				font.bold: true;
			}

			SequentialAnimation {

				id: oScreenshotNoticeAnimation;

				NumberAnimation {

					target: oScreenshotNotice;
					property: "opacity";
					to: 1.0;
					duration: 200
				}

				PauseAnimation {

					duration: 2500;
				}

				NumberAnimation {

					target: oScreenshotNotice;
					property: "opacity";
					to: 0.0;
					duration: 300;
				}
			}
		}
	}

	Connections {

		target: APrivacy;

		function onSgScreenshotTaken() {

			oScreenshotNoticeAnimation.restart();
		}
	}
}

