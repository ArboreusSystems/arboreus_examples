// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/07/2021 at 19:36:19
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AGlobal.js" as GLOBAL;
import "qrc:/js/AColors.js" as COLORS;


// Application
ApplicationWindow {

	property string pText: qsTr("Flickable v1");
	property bool pIsDesktop: GLOBAL.mIsDesktop();

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	Rectangle {

		id: oApplicationWrapper;
		anchors.fill: parent;
		color: COLORS.mBlueDark();

		Flickable {

			id: oFlickable;
			anchors.fill: parent;
			contentWidth: oImage.width;
			contentHeight: oImage.height;
			onDragStarted: console.log("onDragStarted");
			onDragEnded: console.log("onDragEnded");

			rebound: Transition {

				NumberAnimation {

					properties: "x,y";
					duration: 1000;
					easing.type: Easing.OutBounce;
				}
			}

			Image {

				id: oImage;
				width: oImage.sourceSize.width * 2;
				height: oImage.sourceSize.height * 2;
				source: "qrc:/img/photo_petergoff_set_7.jpg";
			}
		}
	}
}
