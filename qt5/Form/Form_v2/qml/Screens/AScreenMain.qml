// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/12/2021 at 20:42:40
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Loader";
import "qrc:/qml/Templates";
import "qrc:/qml/Buttons";


// Component
AScreenTemplate {

	id: oRoot;
	color: COLORS.mGreyLight();
	pObjectName: "ScreenMain";
	pStackView: oApplicationStackView;

	Component.onCompleted: {

		var oLoaderSign = Qt.createComponent("qrc:/qml/Loader/ALoaderSign.qml");
		oRoot.pLoaderSign.sourceComponent = oLoaderSign;
	}

	AButtonTemplate {

		id: oButtonNewModel;
		objectName: "ButtonNewModel";
		text: "Create new model";
		width: parent.width * 0.8;
		height: 100;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.verticalCenterOffset: -oRoot.height * 0.1;

		onClicked: {

			oApplicationStackView.push(oScreenForm);
		}
	}
}
