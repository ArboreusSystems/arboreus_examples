// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/03/2021 at 11:34:16
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.15

// Application includes

// Application
ApplicationWindow {

	property string pText: qsTr("Hello world!");

	id: oApplicationWindow;
	width: 640;
	height: 480;
	visible: true;
	title: oApplicationWindow.pText;

	Video {

		id: video;
		width : parent.width;
		height : parent.height;
		source: "Place URL here";

		MouseArea {

			anchors.fill: parent;
			onClicked: {

				video.playbackState === MediaPlayer.PlayingState ? video.pause() : video.play();
			}
		}

		focus: true;
		Keys.onSpacePressed: video.playbackState === MediaPlayer.PlayingState ? video.pause() : video.play();
		Keys.onLeftPressed: video.seek(video.position - 5000);
		Keys.onRightPressed: video.seek(video.position + 5000);
	}
}
