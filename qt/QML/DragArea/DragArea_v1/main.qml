// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/06/2021 at 14:50:51
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/AGlobal.js" as GLOBAL;
import "qrc:/AColors.js" as COLORS;


// Application
ApplicationWindow {

	property string pText: qsTr("DragArea v1");
	property bool pIsDesktop: GLOBAL.mIsDesktop();

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	Repeater {

		id: oRepeater;
		model: 20;

		Rectangle {

			property point pBeginDrag: Qt.point(0,0);
			property bool pCaught: false;

			id: oItem;
			width: 60;
			height: oItem.width;
			radius: oItem.width / 2;
			z: oMouseArea.drag.active ||  oMouseArea.pressed ? 2 : 1;
			color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
			x: Math.random() * (oApplicationWindow.width - 100);
			y: Math.random() * (oApplicationWindow.height / 2 - 100);
			border.width: 2;
			border.color: COLORS.mWhite();
			Drag.active: oMouseArea.drag.active;

			Text {

				id: oItemText;
				anchors.centerIn: parent;
				text: index;
				color: COLORS.mWhite();
			}

			MouseArea {

				id: oMouseArea
				anchors.fill: parent
				drag.target: parent

				onCanceled: {

					console.log("oMouseArea onCanceled");
				}

				onClicked: {

					console.log("oMouseArea onClicked");
				}

				onDoubleClicked: {

					console.log("oMouseArea onDoubleClicked");
				}

				onEntered: {

					console.log("oMouseArea onEntered");
				}

				onExited: {

					console.log("oMouseArea onExited");
				}

				onPositionChanged: {

					console.log("oMouseArea onPositionChanged");
				}

				onPressAndHold: {

					console.log("oMouseArea onPressAndHold");
				}

				onPressed: {

					console.log("oMouseArea onPressed");

					oItem.pBeginDrag = Qt.point(oItem.x, oItem.y);
				}

				onReleased: {

					console.log("oMouseArea onReleased");

					if(!oItem.pCaught) {
						oBackAnimX.from = oItem.x;
						oBackAnimX.to = oItem.pBeginDrag.x;
						oBackAnimY.from = oItem.y;
						oBackAnimY.to = oItem.pBeginDrag.y;
						oBackAnim.start()
					}
				}

				onWheel: {

					console.log("oMouseArea onWheel");
				}
			}

			ParallelAnimation {

				id: oBackAnim;

				SpringAnimation {

					id: oBackAnimX;
					target: oItem;
					property: "x";
					duration: 500;
					spring: 2;
					damping: 0.2;
				}

				SpringAnimation {

					id: oBackAnimY;
					target: oItem;
					property: "y";
					duration: 500;
					spring: 2;
					damping: 0.2;
				}
			}
		}
	}

	Rectangle {

		id: oDropAreaWrapper;
		height: parent.height / 2;
		width: parent.width;
		color: COLORS.mSalad();
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.bottom: parent.bottom;

		DropArea {

			id: oDropArea;
			anchors.fill: parent;

			onDropped: {

				console.log("oDropArea onDropped");
			}

			onEntered: {

				console.log("oDropArea onEntered");

				drag.source.pCaught = true;
			}

			onExited: {

				console.log("oDropArea onExited");

				drag.source.pCaught = false;
			}

			onPositionChanged: {

				console.log("oDropArea onPositionChanged");
			}
		}
	}
}
