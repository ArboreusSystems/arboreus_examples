// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/07/2021 at 12:16:49
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Templates";


// Component
AMenuItemTemplate {

	property double pMargin: 0;
	property string pTextLabel: "NoDefinedLabelText";
	property string pTextNotice: "NoDefinedNoticeText";

	id: oRoot;
	height: oRoot.mSetHeight();
	color: COLORS.mBlueDark();

	Switch {

		id: oSwitcher;
		anchors.right: parent.right;
		anchors.rightMargin: oRoot.pMargin;
		anchors.verticalCenter: oLabel.verticalCenter;
	}

	Text {

		id: oLabel;
		text: oRoot.pTextLabel;
		color: COLORS.mWhiteLight();
		font.bold: true;
		font.pixelSize: 18;
		anchors.top: parent.top;
		anchors.topMargin: 15;
		anchors.right: oSwitcher.left;
		anchors.rightMargin: 5;
		anchors.left: parent.left;
		anchors.leftMargin: oRoot.pMargin;

	}

	Text {

		id: oNotice;
		text: oRoot.pTextNotice;
		color: COLORS.mWhiteLight();
		font.pixelSize: 14;
		anchors.top: oLabel.bottom;
		anchors.topMargin: 5;
		anchors.right: oSwitcher.left;
		anchors.rightMargin: 5;
		anchors.left: parent.left;
		anchors.leftMargin: oRoot.pMargin;
	}

	function mSetHeight() {

		return oLabel.height + 5 + oNotice.height + 35;
	}
}
