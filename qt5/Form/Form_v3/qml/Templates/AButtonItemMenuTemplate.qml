// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/02/2022 at 11:25:20
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Rectangle {

	property alias pSize: oRoot.width;
	property alias pImageSource: oImage.source;
	property alias pImageRotation: oImage.rotation;
	property string pColorNormal: COLORS.mBlueDark();
	property string pColorPressed: COLORS.mSaladLight();

	id: oRoot;
	objectName: "ButtonItemMenuTemplate";
	width: 20;
	height: oRoot.pSize;
	radius: oRoot.width * 0.5;
	color: oMouseArea.pressed ? oRoot.pColorPressed : oRoot.pColorNormal;

	Image {

		id: oImage;
		anchors.fill: parent;
	}

	MouseArea {

		id: oMouseArea;
		anchors.fill: parent;

		onClicked: {

			if (typeof oRoot.mOnClicked === "function")	oRoot.mOnClicked();
			console.log(oRoot.objectName,"clicked");
		}
	}
}
