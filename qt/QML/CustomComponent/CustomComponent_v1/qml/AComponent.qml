// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/09/2020 at 16:49:48
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Component
Rectangle {

	property alias pContent: oObjectContent.data;

	id: oObjectWrapper;
	color: COLORS.mFiolentLight();

	Rectangle {

		id: oObjectContent;
		color: COLORS.mSalad();
		width: oObjectWrapper.width - 20;
		height: oObjectWrapper.height - 20;
		anchors.verticalCenter: oObjectWrapper.verticalCenter;
		anchors.horizontalCenter: oObjectWrapper.horizontalCenter;
	}
}
