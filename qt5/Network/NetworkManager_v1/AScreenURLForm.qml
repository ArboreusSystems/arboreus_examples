// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/04/2021 at 17:10:55
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 1.4

// Application includes
import "qrc:/AColors.js" as COLORS;


// Component
AScreen {

	id: oRoot;
	color: COLORS.mBlue();

	TextField {

		id: oTextField;
		width: parent.width * 0.8;
		height: parent.width * 0.1;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.verticalCenterOffset: -50;
		anchors.horizontalCenter: parent.horizontalCenter;
		font.pixelSize: oTextField.height * 0.55;
	}

	Button {

		id: oButtonLoadFile;
		width: oTextField.width;
		height: oTextField.height * 1.15;
		anchors.horizontalCenter: oTextField.horizontalCenter;
		anchors.top: oTextField.bottom;
		anchors.topMargin: oTextField.height * 0.6;
		text: qsTr("Load URL");
		onClicked: oButtonLoadFile.mOnClicked();

		function mOnClicked () {

			ALogger.mWriteToLog("Button clicked");

			if (oTextField.text !== "") {
				ANetwork.mDownload(oTextField.text);
			} else {
				ALogger.mWriteToLog("Nothing to be downloaded. Empty URL.");
			}
		}
	}
}
