// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/06/2020 at 12:25:05
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/Colors.js" as COLORS;


// Component
Rectangle {

	property int pPadding: 15;
	property bool pOpenned: false;

	id: oTextWrapper;
	color: oListView.currentIndex === index ? COLORS.mBlueDark() : COLORS.mSaladLight();
	clip: true;
	implicitHeight: oText.implicitHeight + 2 * oTextWrapper.pPadding;
	implicitWidth: oListView.width;

	Text {

		id: oText;
		text: model.text;
		font.pixelSize: 18;
		width: parent.width - 2 * oTextWrapper.pPadding;
		wrapMode: Text.WordWrap;
		color: oListView.currentIndex === index ? COLORS.mWhiteLight() : COLORS.mBlack();
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.top: parent.top;
		anchors.topMargin: oTextWrapper.pPadding;
		Component.onCompleted: {

			console.log("onCompleted",model.index,model.text);
		}
		Component.onDestruction: {

			console.log("onDestruction",model.index,model.text);
		}
	}

	Rectangle {

		id: oDelegate3ServiceMenu;
		color: oListView.currentIndex === index ? COLORS.mWhiteLight() : COLORS.mPurpleDark();
		height: 50;
		width: parent.width;
		visible: false;
		anchors.bottom: parent.bottom;
		anchors.left: parent.left;
		anchors.right: parent.right;

		Text {

			id: oDelegateServiceText;
			text: qsTr("Delegate item service popup block");
			color: oListView.currentIndex === index ? COLORS.mBlueDark() : COLORS.mWhite();
			anchors.horizontalCenter: parent.horizontalCenter;
			anchors.verticalCenter: parent.verticalCenter;
		}
	}

	MouseArea {

		id: oMouseArea;
		anchors.fill: parent;
		onClicked: {

			oListView.currentIndex = index;
			console.log("oMouseArea onClicked");
		}
		onPressed: {

			console.log("oMouseArea onPressed");
		}
		onCanceled: {

			console.log("oMouseArea onCanceled");
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

			if (oTextWrapper.pOpenned) {
				oTextWrapper.implicitHeight = oText.implicitHeight + 2 * oTextWrapper.pPadding;
				oDelegate3ServiceMenu.visible = false;
				oTextWrapper.pOpenned = false;
			} else {
				oTextWrapper.implicitHeight = oText.implicitHeight + 2 * oTextWrapper.pPadding + oDelegate3ServiceMenu.height;
				oDelegate3ServiceMenu.visible = true;
				oTextWrapper.pOpenned = true;
			}
			console.log("oMouseArea onPressAndHold");
		}
		onReleased: {

			console.log("oMouseArea onPressAndHold");
		}
		onWheel: {

			console.log("oMouseArea onWheel");
		}
	}
}
