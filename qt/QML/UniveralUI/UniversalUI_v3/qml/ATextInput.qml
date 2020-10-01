// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/10/2020 at 14:03:25
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15;

// Application includes
import "qrc:/js/Colors.js" as COLORS;


// Component
Rectangle {

	property int pBorderSize: 0;

	id: oRoot;

	TextInput {

		id: oTextInput;
		width: parent.width - oRoot.pBorderSize * 2;
		height: parent.height - oRoot.pBorderSize * 2;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
		horizontalAlignment: Text.AlignHCenter;
		verticalAlignment: Text.AlignVCenter;
	}
}
