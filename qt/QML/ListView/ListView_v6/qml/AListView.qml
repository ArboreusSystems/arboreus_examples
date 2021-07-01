// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/07/2021 at 18:11:37
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Component
ScrollView {

	property ListModel pModel;
	property Item pDraggedItemParent;

	id: oScrollView;
	anchors.fill: parent;

	ListView {

		id: oListView;
		width: parent.width;
		model: oScrollView.pModel;
		spacing: 5;
		delegate: ADraggableItemTemplate {

			id: oDelegate;
			pDraggedItemParent: oScrollView.pDraggedItemParent;

			onSgMoveItem: {

				console.log("Item moved from",inFrom,"to",inTo);
				oScrollView.pModel.move(inFrom,inTo,1);
			}

			Rectangle {

				id: oDelegateItem;
				width: oListView.width;
				height: oDelegateLabel.height * 2.5;
				color: COLORS.mRandom();
				anchors.centerIn: parent;

				Text {

					id: oDelegateLabel;
					text: "Element " + model.number;
					anchors.centerIn: parent;
					color: COLORS.mWhiteLight();
					font.bold: true;
					font.pixelSize: 18;
				}
			}
		}
	}
}
