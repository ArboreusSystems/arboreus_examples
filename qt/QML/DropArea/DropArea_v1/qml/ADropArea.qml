// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/06/2021 at 19:06:47
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Rectangle {

	id: oRoot;
	width: parent.width;
	height: parent.height;
	color: COLORS.mSaladLight();

	DropArea {

		id: oDropArea;
		width: parent.width * 0.3;
		height: oDropArea.width;
		anchors.centerIn: parent;

		onDropped: {

			console.log("oDropArea onDropped");

			oDropAreaRectangle.state = "DEFAULT";
		}

		onEntered: {

			console.log("oDropArea onEntered");

			oDropAreaRectangle.state = "IN";
		}

		onExited: {

			console.log("oDropArea onExited");

			oDropAreaRectangle.state = "DEFAULT";
		}

		onPositionChanged: {

			console.log("oDropArea onPositionChanged");
		}

		onContainsDragChanged: {

			console.log("oDropArea onContainsDragChanged:",oDropArea.containsDrag);
		}

		Rectangle {

			id: oDropAreaRectangle;
			anchors.fill: parent;
			state: "DEFAULT";

			states: [

				State {name: "DEFAULT";

					PropertyChanges {target: oDropAreaRectangle; color: COLORS.mFiolent();}
				},
				State {name: "IN";

					PropertyChanges {target: oDropAreaRectangle; color: COLORS.mOrange();}
				}
			]
		}
	}

	Rectangle {

		id: oMouseAreaWrapper;
		x: 0;
		y: 0;
		width: 20;
		height: 20;
		color: COLORS.mRedDark();

		Drag.active: oDragArea.drag.active;
		Drag.hotSpot.x: 10;
		Drag.hotSpot.y: 10;

		MouseArea {

			id: oDragArea;
			anchors.fill: parent;
			drag.target: parent;

			onCanceled: {

				console.log("oDragArea onCanceled");
			}

			onClicked: {

				console.log("oDragArea onClicked");
			}

			onDoubleClicked: {

				console.log("oDragArea onDoubleClicked");
			}

			onEntered: {

				console.log("oDragArea onEntered");
			}

			onExited: {

				console.log("oDragArea onExited");
			}

			onPositionChanged: {

				console.log("oDragArea onPositionChanged");
			}

			onPressAndHold: {

				console.log("oDragArea onPressAndHold");
			}

			onPressed: {

				console.log("oDragArea onPressed");
			}

			onReleased: {

				console.log("oDragArea onReleased");

				parent.Drag.drop();
			}

			onWheel: {

				console.log("oDragArea onWheel");
			}
		}
	}
}
