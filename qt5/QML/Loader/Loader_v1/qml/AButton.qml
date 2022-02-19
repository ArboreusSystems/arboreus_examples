// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/07/2021 at 17:02:05
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

// Application includes
import "qrc:/js/AGlobal.js" as GLOBAL;
import "qrc:/js/AColors.js" as COLORS;


// Component
Button {

	id: oRoot;
	Layout.fillWidth: true;
	Layout.fillHeight: true;

	background: Rectangle {

		id: oBackground;
		color: oRoot.down ? COLORS.mGreen() : COLORS.mFiolent();
		anchors.fill: parent;
	}

	contentItem: Text {

		id: oText;
		text: oRoot.text;
		color: oRoot.down ? COLORS.mWhiteLight() : COLORS.mWhite();
		anchors.fill: parent;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
	}
}
