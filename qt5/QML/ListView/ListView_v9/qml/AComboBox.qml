// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/10/2021 at 12:01:40
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
ComboBox {

	property int pIndex: 0;

	id: oRoot;
	model: ["By Registered ID","By First Name", "By Last Name","By Phone Number"];
	font.pixelSize: 18;
	font.bold: true;

	onAccepted: console.log("onAccepted with:",currentIndex);
	onHighlighted: console.log("onHighlighted with:",index);

	onActivated: {

		console.log("onActivated with:",index);
		oRoot.pIndex = index;
	}

	Component.onCompleted: {

		oRoot.pIndex = currentIndex;
	}

	delegate: ItemDelegate {

		id: oDelegate;
		width: oRoot.width;
		highlighted: oRoot.highlightedIndex === index;

		contentItem: Rectangle {

			id: oDelegateContentItem;
			anchors.fill: parent;
			color: oDelegate.focus ? COLORS.mBlueLight() : COLORS.mRedDark();

			Text {

				id: oDelegateText;
				text: modelData;
				color: oRoot.pressed ? COLORS.mBlack() : COLORS.mWhiteLight();
				anchors.verticalCenter: parent.verticalCenter;
				anchors.left: parent.left;
				anchors.leftMargin: 10;
				font.pixelSize: 18;
			}
		}
	}

	contentItem: Rectangle {

		id: oContentItem;
		anchors.fill: parent;
		color: COLORS.mOrangeLight();

		Text {

			id: oContentItemText;
			text: oRoot.displayText;
			color: COLORS.mBlack();
			font.bold: true;
			font.pixelSize: 18;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.left: parent.left;
			anchors.leftMargin: 10;
		}
	}

	popup: Popup {

		y: oRoot.height - 1;
		width: oRoot.width;
		implicitHeight: contentItem.implicitHeight;
		padding: 0;

		contentItem: ListView {

			clip: true;
			implicitHeight: contentHeight;
			model: oRoot.popup.visible ? oRoot.delegateModel : null;
			currentIndex: oRoot.highlightedIndex;

			ScrollIndicator.vertical: ScrollIndicator {}
		}
	}
}
