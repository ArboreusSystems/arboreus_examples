// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/08/2021 at 12:23:15
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AGlobal.js" as GLOBAL;
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml";


// Application
ApplicationWindow {

	property string pText: qsTr("Zoom v1");
	property bool pIsDesktop: GLOBAL.mIsDesktop();

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	Rectangle {

		id: oApplicationWrapper;
		anchors.fill: parent;
		color: COLORS.mBlue();

		ScrollView {

			id: oScrollView;
			width: parent.width;
			anchors.top: parent.top;
			anchors.bottom: oFooter.top;
			anchors.horizontalCenter: parent.horizontalCenter;
			contentWidth: oZoomedImage.width * oZoomedImage.scale;
			contentHeight: oZoomedImage.height * oZoomedImage.scale;

			Image {

				id: oZoomedImage;
				source: "qrc:/img/photo_houston_set_0.jpg";
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.verticalCenter: parent.verticalCenter;
			}
		}

		Rectangle {

			id: oFooter;
			width: parent.width;
			height: 150;
			anchors.bottom: parent.bottom;
			anchors.horizontalCenter: parent.horizontalCenter;
			color: COLORS.mFiolent();

			ASlider {

				id: oSlider;
				width: parent.width * 0.7;
				height: 50;
				anchors.centerIn: parent;

				onPositionChanged: {

					oZoomedImage.scale = oSlider.value;
				}
			}
		}
	}
}
