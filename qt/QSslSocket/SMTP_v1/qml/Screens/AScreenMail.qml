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

	property var pMessage;

	id: oRoot;
	color: COLORS.mFiolent();

	Component.onCompleted: {

		oRoot.pMessage = ASMTP.mTemplateMessage();
		oRoot.pMessage.ID = ASMTP.mMessageIDGenerate();

		oRoot.mUpdateMessage();
	}

	Rectangle {

		id: oHeader;
		color: COLORS.mRedDark();
		width: parent.width;
		height: 75;

		Text {

			id: oHeaderText;
			text: "Message";
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

			function mOnFocusChanged() {

				console.log(oInputFrom.objectName,"mOnFocusChanged");
			}

			function mOnEditingFinished() {

				console.log("oInputFrom.pInputText:",oInputFrom.pTextInput);
				oRoot.pMessage.From = oInputFrom.pTextInput;
				oRoot.mUpdateMessage();

				console.log(oInputFrom.objectName,"mOnEditingFinished");
			}

			function mOnAccepted() {

				console.log(oInputFrom.objectName,"mOnAccepted");
			}
		}

		AInputTo {

			id: oInputTo;

			function mOnFocusChanged() {

				console.log(oInputTo.objectName,"mOnFocusChanged");
			}

			function mOnEditingFinished() {

				console.log("oInputTo.pInputText:",oInputTo.pTextInput);
				oRoot.pMessage.To = oInputTo.pTextInput;
				oRoot.mUpdateMessage();

				console.log(oInputTo.objectName,"mOnEditingFinished");
			}

			function mOnAccepted() {

				console.log(oInputTo.objectName,"mOnAccepted");
			}
		}

		AInputSubject {

			id: oInputSubject;

			function mOnFocusChanged() {

				console.log(oInputSubject.objectName,"mOnFocusChanged");
			}

			function mOnEditingFinished() {

				console.log("oInputSubject.pInputText:",oInputSubject.pTextInput);
				oRoot.pMessage.Subject = oInputSubject.pTextInput;
				oRoot.mUpdateMessage();

				console.log(oInputSubject.objectName,"mOnEditingFinished");
			}

			function mOnAccepted() {

				console.log(oInputSubject.objectName,"mOnAccepted");
			}
		}

		AInputMessage {

			id: oInputMessage;

			function mOnFocusChanged() {

				console.log(oInputMessage.objectName,"mOnFocusChanged");
			}

			function mOnEditingFinished() {

				console.log("oInputMessage.pInputText:",oInputMessage.pTextInput);
				oRoot.pMessage.Message = oInputMessage.pTextInput;
				oRoot.mUpdateMessage();

				console.log(oInputMessage.objectName,"mOnEditingFinished");
			}

			function mOnAccepted() {

				console.log(oInputMessage.objectName,"mOnAccepted");
			}
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

		onClicked: {

			ASMTP.mMessageSend(oRoot.pMessage.ID);
		}
	}

	function mUpdateMessage() {

		ACache.mPutInCache(oRoot.pMessage.ID,oRoot.pMessage);
		console.log("Message update in cache. ID:",oRoot.pMessage.ID);
	}
}
