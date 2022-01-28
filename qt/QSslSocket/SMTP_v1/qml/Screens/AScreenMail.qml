// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/01/2022 at 16:55:38
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Buttons";
import "qrc:/qml/Input";


// Component
Rectangle {

	id: oRoot;
	color: COLORS.mFiolent();

	Rectangle {

		id: oHeader;
		color: COLORS.mRedDark();
		width: parent.width;
		height: 75;

		Text {

			id: oHeaderText;
			text: "Write message";
			color: COLORS.mWhiteLight();
			font.bold: true;
			font.pixelSize: 20;
			anchors.fill: parent;
			verticalAlignment: Text.AlignVCenter;
			horizontalAlignment: Text.AlignHCenter;
		}
	}

	Column {

		id: oMessageForm;
		width: parent.width * 0.8;
		anchors.top: oHeader.bottom;
		anchors.horizontalCenter: parent.horizontalCenter;
		topPadding: 10;
		spacing: 5;

		AInputFrom {

			id: oInputFrom;
		}

		AInputTo {

			id: oInputTo;
		}

		AInputSubject {

			id: oInputSubject;
		}

		AInputMessage {

			id: oInputMessage;
		}
	}

	AButtonServer {

		id: oButtonServerSettings;
		width: parent.width * 0.8;
		height: 50;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: 50;
	}

	AButtonSendMessage {

		id: oButtonSendMessage;
		width: parent.width * 0.8;
		height: 75;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.bottom: oButtonServerSettings.top;
		anchors.bottomMargin: 20;
	}
}
