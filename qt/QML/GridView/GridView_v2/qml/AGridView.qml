// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/06/2021 at 11:44:57
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes

// Application paths
import "qrc:/js/AColors.js" as COLORS;


// Component
Item {

	property var pData: [

		{"pImagePath":"qrc:/images/photo_alexandriya_set_7.jpg"},
		{"pImagePath":"qrc:/images/photo_aphines.acropolis_set_18.jpg"},
		{"pImagePath":"qrc:/images/photo_banton_set_2.jpg"},
		{"pImagePath":"qrc:/images/photo_caribeanstorm_set_3.jpg"},
		{"pImagePath":"qrc:/images/photo_cartagenabay_set_5.jpg"},
		{"pImagePath":"qrc:/images/photo_helsinki_set_16.jpg"},
		{"pImagePath":"qrc:/images/photo_houston_set_7.jpg"},
		{"pImagePath":"qrc:/images/photo_maracaibo_set_1.jpg"},
		{"pImagePath":"qrc:/images/photo_petergoff_set_6.jpg"},
		{"pImagePath":"qrc:/images/photo_rok5iceage_set_6.jpg"},
		{"pImagePath":"qrc:/images/photo_rok5seacuisine_set_3.jpg"},
		{"pImagePath":"qrc:/images/photo_suez_set_12.jpg"}
	];

	id: oRoot;
	anchors.fill: parent;

	ListModel {

		id: oListModel;

		Component.onCompleted: {

			for (var i = 0; i < oRoot.pData.length; i++) {
				oListModel.append(oRoot.pData[i]);
			}
		}


//		ListElement {pImagePath:"qrc:/images/photo_alexandriya_set_7.jpg";}
//		ListElement {pImagePath:"qrc:/images/photo_aphines.acropolis_set_18.jpg";}
//		ListElement {pImagePath:"qrc:/images/photo_banton_set_2.jpg";}
//		ListElement {pImagePath:"qrc:/images/photo_caribeanstorm_set_3.jpg";}
//		ListElement {pImagePath:"qrc:/images/photo_cartagenabay_set_5.jpg";}
//		ListElement {pImagePath:"qrc:/images/photo_helsinki_set_16.jpg";}
//		ListElement {pImagePath:"qrc:/images/photo_houston_set_7.jpg";}
//		ListElement {pImagePath:"qrc:/images/photo_maracaibo_set_1.jpg";}
//		ListElement {pImagePath:"qrc:/images/photo_petergoff_set_6.jpg";}
//		ListElement {pImagePath:"qrc:/images/photo_rok5iceage_set_6.jpg";}
//		ListElement {pImagePath:"qrc:/images/photo_rok5seacuisine_set_3.jpg";}
//		ListElement {pImagePath:"qrc:/images/photo_suez_set_12.jpg";}
	}

	Component {

		id: oDelegate;

		Item {

			id: oDelegateWrapper;
			width: oGridView.cellWidth;
			height: oGridView.cellHeight;

			Image {

				id: oDelegateImage;
				source: pImagePath;
				width: oDelegateWrapper.width * 0.8;
				height: oDelegateWrapper.width * 0.8;
				anchors.centerIn: parent;
				smooth: true;
				fillMode: Image.PreserveAspectCrop;

				Rectangle {

					id: oDelegateBorder;
					anchors.fill: parent;
					color: COLORS.mTransparent();
					border.color: COLORS.mWhite();
					border.width: 10;
					opacity: 0;
				}
			}

			Rectangle {

				id: oImagePointer;
				width: oDelegateWrapper.width * 0.4;
				height: oImagePointer.width;
				radius: oImagePointer.width * 0.5;
				color: COLORS.mFiolent();
				anchors.centerIn: parent;
				smooth: true;
				opacity: 0;
			}

			states: [

				State {

					name: "IN_DRAG";
					when: index == oGridView.pDraggedItemIndex;
					PropertyChanges {target: oDelegateBorder; opacity: 1 }
					PropertyChanges {target: oImagePointer; opacity: 1 }
					PropertyChanges {target: oDelegateImage; parent: oContainer;}
					PropertyChanges {target: oDelegateImage; anchors.centerIn: undefined;}
					PropertyChanges {target: oDelegateImage; x: oGridMouseArea.mouseX - oDelegateImage.width / 2;}
					PropertyChanges {target: oDelegateImage; y: oGridMouseArea.mouseY - oDelegateImage.height / 2;}
				}
			]
		}
	}

	GridView {

		property int pDraggedItemIndex: -1;

		id: oGridView;
		anchors.fill: parent;
		anchors.margins: oGridView.mMargins();
		cellWidth: oGridView.mCellSize();
		cellHeight: oGridView.mCellSize();
		model: oListModel;
		delegate: oDelegate;
		interactive: false;

		Item {

			id: oContainer;
			anchors.fill: parent;
		}

		MouseArea {

			id: oGridMouseArea;
			anchors.fill: parent;

			onCanceled: {

				console.log("oGridMouseArea onCanceled");
			}

			onClicked: {

				console.log("oGridMouseArea onClicked");
			}

			onDoubleClicked: {

				console.log("oGridMouseArea onDoubleClicked");
			}

			onEntered: {

				console.log("oGridMouseArea onEntered");
			}

			onExited: {

				console.log("oGridMouseArea onExited");
			}

			onPositionChanged: {

				console.log("oGridMouseArea onPositionChanged");
			}

			onPressAndHold: {

				console.log("oGridMouseArea onPressAndHold");
			}

			onPressed: {

				console.log("oGridMouseArea onPressed");

				oGridView.pDraggedItemIndex = oGridView.indexAt(mouseX,mouseY);
			}

			onReleased: {

				console.log("oGridMouseArea onReleased");

				if (oGridView.pDraggedItemIndex != -1) {
					var oDraggedIndex = oGridView.pDraggedItemIndex;
					oGridView.pDraggedItemIndex = -1;
					oListModel.move(oDraggedIndex,oGridView.indexAt(mouseX,mouseY),1);
				}
			}

			onWheel: {

				console.log("oGridMouseArea onWheel");
			}
		}

		function mMargins() {

			return oApplicationWindow.width * 0.25 * 0.2
		}

		function mCellSize() {

			return (oApplicationWindow.width - oGridView.mMargins() * 2) * 0.25
		}
	}
}
