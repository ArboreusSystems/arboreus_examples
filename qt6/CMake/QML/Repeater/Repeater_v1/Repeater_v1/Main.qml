// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/06/2026 at 09:16:31
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;


// Application Main window
Window {

	property string oTitle: "Main Window Repeater_v1";

	id: oMainWindow;
	width: 640;
	height: 480;
	visible: true;
	title: qsTr(oTitle);

	Rectangle {

		id: oRowBlock;
		width: parent.width;
		height: 30;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;

		Row {

			property int pCount: 15;

			id: oRow;
			anchors.fill: parent;

			Repeater {

				model: oRow.pCount;

				Rectangle {

					width: oRowBlock.width / oRow.pCount;
					height: oRowBlock.height;
					color: Qt.rgba(Math.random(),Math.random(),Math.random(),1);
				}
			}
		}
	}
}
