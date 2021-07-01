// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/07/2021 at 16:58:03
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml";


// Component
Item {

	default property Item pContentItem;
	property Item pDraggedItemParent;
	property bool pDragActive: false;
	property int pScrollEdge: 10;
	property int pScrollingDirection: 0;
	property ListView pListView: ListView.view;

	signal sgMoveItem(int inFrom, int inTo);

	id: oRoot;
	width: pContentItem.width;
	height: oPlaceholderTop.height + oWrapperParent.height + oPlaceholderBottom.height;

	onPContentItemChanged: {

		pContentItem.parent = oContentItemWrapper;
	}

	Rectangle {

		id: oPlaceholderTop;
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.top: parent.top;
		height: 0;
		color: COLORS.mSaladDark();
		opacity: 0.2;
	}

	Item {

		id: oWrapperParent;
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.top: oPlaceholderTop.bottom;
		height: pContentItem.height;

		Rectangle {

			id: oContentItemWrapper;
			anchors.fill: parent;
			Drag.active: oDragArea.drag.active;

			Drag.hotSpot {

				x: pContentItem.width * 0.5
				y: pContentItem.height * 0.5
			}

			MouseArea {

				id: oDragArea;
				anchors.fill: parent;
				drag.target: pDragActive ? parent : undefined;
				drag.axis: ListView.orientation === ListView.Horizontal ? Drag.XAxis : Drag.YAxis;
				drag.smoothed: false;

				onCanceled: {

					console.log("oDragArea onCanceled");
					pDragActive = false;
				}

				onClicked: {

					console.log("oDragArea onClicked");
				}

				onEntered: {

					console.log("oDragArea onEntered");
				}

				onExited: {

					console.log("oDragArea onExited");
				}

				onPositionChanged: {

					console.log("oDragArea onPositionChanged x:",oDragArea.mouseX," y:",oDragArea.mouseY);
				}

				onPressAndHold: {

					console.log("oDragArea onPressAndHold");
					pDragActive = true;
				}

				onPressed: {

					console.log("oDragArea onPressed");
				}

				onReleased: {

					console.log("oDragArea onReleased");
					if (drag.active) mMoveItem();
					pDragActive = false;
				}
			}
		}
	}

	Rectangle {

		id: oPlaceholderBottom;
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.top: oWrapperParent.bottom;
		height: 0;
		color: COLORS.mSaladDark();
		opacity: 0.2;
	}

	SmoothedAnimation {

		id: oAnimationUp;
		target: pListView;
		property: "contentY";
		to: 0;
		running: pScrollingDirection == -1;
	}

	SmoothedAnimation {

		id: oAnimationDown;
		target: pListView;
		property: "contentY";
		to: pListView.contentHeight - pListView.height;
		running: pScrollingDirection == 1;
	}

	Loader {

		id: oLoaderTopDropArea;
		active: model.index === 0;
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.bottom: oWrapperParent.verticalCenter;
		height: pContentItem.height
		sourceComponent: Component {

			DropArea {

				property int pDropIndex: 0
			}
		}
	}

	DropArea {

		property int pDropIndex: model.index + 1;
		property bool pIsLast: model.index === pListView.count - 1;

		id: oBottomDropArea;
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.top: oWrapperParent.verticalCenter;
		enabled: !oDragArea.drag.active;
		height: pIsLast ? pListView.contentHeight - y : pContentItem.height;
		onDropped: console.log("oBottomDropArea onDropped");
		onEntered: console.log("oBottomDropArea onEntered");
		onExited: console.log("oBottomDropArea onExited");
		onPositionChanged: console.log("oBottomDropArea onPositionChanged x:",oBottomDropArea.drag.x,"y:",oBottomDropArea.drag.y);
	}

	states: [

		State {

			name: "DRAGING";
			when: oDragArea.drag.active;

			ParentChange {

				target: oContentItemWrapper;
				parent: pDraggedItemParent;
			}

			PropertyChanges {

				target: oContentItemWrapper;
				opacity: 0.5;
				anchors.fill: undefined;
				width: pContentItem.width;
				height: pContentItem.height;
			}

			PropertyChanges {

				target: oWrapperParent;
				height: 0;
			}

			PropertyChanges {

				target: oRoot;
				pScrollingDirection: {

					var yCoord = pListView.mapFromItem(oDragArea, 0, oDragArea.mouseY).y;
					if (yCoord < pScrollEdge) {
						-1;
					} else if (yCoord > pListView.height - pScrollEdge) {
						1;
					} else {
						0;
					}
				}
			}
		},

		State {

			name: "HOLDING";
			when: pDragActive;

			PropertyChanges {

				target: oContentItemWrapper;
				opacity: 0.5;
			}
		},

		State {

			name: "DROP_BELOW";
			when: oBottomDropArea.containsDrag;

			PropertyChanges {

				target: oPlaceholderBottom;
				height: pContentItem.height;
			}

			PropertyChanges {

				target: oBottomDropArea;
				height: pContentItem.height * 2;
			}
		},

		State {

			name: "DROP_ABOVE";
			when: {

				return oLoaderTopDropArea.item != null ? oLoaderTopDropArea.item.containsDrag : false;
			}

			PropertyChanges {

				target: oPlaceholderTop;
				height: pContentItem.height;
			}

			PropertyChanges {

				target: oLoaderTopDropArea;
				height: pContentItem.height * 2;
			}
		}
	]

	Timer {

		id: oTimer;
		interval: 0;
		onTriggered: {

			pListView.positionViewAtIndex(model.index, ListView.Contain);
		}
	}

	function mMoveItem() {

		var oDropArea = oContentItemWrapper.Drag.target;
		if (!oDropArea) return;

		var oDropIndex = oDropArea.pDropIndex;
		if (model.index < oDropIndex) oDropIndex--;
		if (model.index === oDropIndex) return;

		oRoot.sgMoveItem(model.index, oDropIndex);
		oTimer.start();
	}
}

